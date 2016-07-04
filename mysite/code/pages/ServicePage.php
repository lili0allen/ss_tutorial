<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 5/25/16
 * Time: 11:49 AM
 */

class ServicePage extends Page{
    public function _getServiceEntries(){
        $entries = ServiceEntry::get()->sort('Created','DESC');
        return $entries;
    }
}

class ServicePage_Controller extends Page_Controller{
    private static $allowed_actions =array(
        'ServiceForm','search','edit','entry'
    );

    public function init() {
        parent::init();
        Requirements::javascript('//cdn.tinymce.com/4/tinymce.min.js');
        Requirements::javascript('https://maps.googleapis.com/maps/api/js?key=AIzaSyCwlMt5FInggZeqhh1HQrUcyFDwGXDcsBo&libraries=places');
        Requirements::customScript("tinymce.init({selector: '#Content textarea'});");
    }

    public function index(SS_HTTPRequest $request){
        $entries = ServiceEntry::get();
        $filters = ArrayList::create();

//        if($search = $request->getVar('Keywords')){
//            $filters->push(ArrayData::create(array(
//                'Label' => "Service: ‘$search'",
//                'RemoveLink' => HTTP::setGetVar('Keywords', null)
//            )));
//            $entries = $entries->filterAny(
//                array(
//                    'Title:PartialMatch' => $search,
//                    'SubDomain:PartialMatch' => $search,
//                    'Address:PartialMatch' => $search,
//                    'Description:PartialMatch' => $search,
//                    'Content:PartialMatch' => $search
//                )
//            );
//        }

        if($service = $request->getVar('Service')){
            $filters->push(ArrayData::create(array(
                'Label' => "Service: ‘$service'",
                'RemoveLink' => HTTP::setGetVar('Service', null)
            )));
            $entries = $entries->filter(
                array(
                    'ServiceValue:PartialMatch' => '"'.$service.'"'
                )
            );
        }

        if($postcode = $request->getVar('Postcode')){
            $filters->push(ArrayData::create(array(
                'Label' => "Postcode: ‘$postcode'",
                'RemoveLink' => HTTP::setGetVar('Postcode', null)
            )));
            $entries = $entries->filter(
                array(
                    'Postcode:ExactMatch' => $postcode
                )
            );
        }

        return array(
            'ServiceEntries' => $entries
        );
    }
    
    public function SearchForm(){
        $fields = new FieldList(
//            TextField::create('Keywords')
//                ->addExtraClass('form-control'),
            DropdownField::create('Service', 'Service', DynamicList::get_dynamic_list('ServiceType')->itemArray())
                ->setEmptyString('Select one')
                ->addExtraClass('form-control'),
            TextField::create('Postcode', 'Postcode')
                ->addExtraClass('form-control')
        );
        $actions = new FieldList(
            new FormAction('SearchEntries', 'Search')
        );
        $Form = new Form($this, __FUNCTION__, $fields, $actions);
        $Form->setFormMethod('GET')
            ->setFormAction($this->Link())//post to index()
            ->disableSecurityToken()
            ->loadDataFrom($this->request->getVars());
        return $Form;
    }

    public function ServiceForm(){
        $user_ip = (isset($_SERVER['REMOTE_ADDR'])) ? $_SERVER['REMOTE_ADDR'] : "";
        $fields = new FieldList(
            TextField::create('Title', 'Title')
                ->addExtraClass('form-control required'),
            TextField::create('SubDomain', 'SubDomain')
                ->addExtraClass('form-control required'),
            TextField::create('Address', 'Address')
                ->addExtraClass('form-control required'),
            MultiValueCheckboxFieldBS::create('Service', 'Service', DynamicList::get_dynamic_list('ServiceType')->itemArray())
                ->addExtraClass('required'),
            TextareaField::create('Description', 'Description')
                ->addExtraClass('form-control required'),
            EmailField::create('Email', 'Email')
                ->addExtraClass('form-control required'),
            TextField::create('Phone', 'Phone')
                ->addExtraClass('form-control required'),
            TextField::create('Wechat', 'Wechat')
                ->addExtraClass('form-control required'),
            TextField::create('QQ', 'QQ')
                ->addExtraClass('form-control required'),
            TextField::create('Website', 'Website')
                ->addExtraClass('form-control required'),
            HtmlEditorField::create('Content', 'Content')
                ->addExtraClass('form-control required'),
            CheckboxField::create("Terms", "Terms & Conditions")
                ->setAttribute("required", true)
                ->addExtraClass('required'),
            HiddenField::create('Suburb', 'Suburb')
                ->setAttribute("data-geo","locality"),
            HiddenField::create('State', 'State')
                ->setAttribute("data-geo","administrative_area_level_1"),
            HiddenField::create('Postcode', 'Postcode')
                ->setAttribute("data-geo","postal_code"),
            HiddenField::create('Lat', 'Lat')
                ->setAttribute("data-geo","lat"),
            HiddenField::create('Lng', 'Lng')
                ->setAttribute("data-geo","lng"),
            HiddenField::create('IPAddress', 'IPAddress', $user_ip)
        );
        $fields->push($logo = FileAttachmentField::create("Logo", "Logo"));
        $logo->setAutoProcessQueue(false)->setFolderName('service')
            ->setMaxFilesize(1)
            ->imagesOnly();

        $fields->push($imageGallery = FileAttachmentField::create("Images", "Image Gallery"));
        $imageGallery->setAutoProcessQueue(false)
            ->setMaxFilesize(1)
            ->imagesOnly();

        $actions = new FieldList(
            new FormAction('SaveService', 'Save')
        );
        $validator = new RequiredFields('Title', 'SubDomain','State');
        $Form = new Form($this, __FUNCTION__, $fields, $actions, $validator);

        if($serviceID = Member::currentUser()->ServiceEntryID){
            $service = DataObject::get_by_id('ServiceEntry', $serviceID);
            $Form->loadDataFrom($service->data());
        }
        return $Form;
    }

    public function SaveService($data, $form){
        if($CurrentMember = Member::currentUser()){

            if($CurrentMember->ServiceEntryID){
                $service = $CurrentMember->ServiceEntry();
                $form->saveInto($service);
                $service->write();
            }else{
                $service = new ServiceEntry();
                $form->saveInto($service);
                $serviceID = $service->write();
                $CurrentMember->ServiceEntryID = $serviceID;
                $CurrentMember->write();
            }
            return $this->redirect($this->Link('edit?saved=1'));
        }else{
            return Security::PermissionFailure($this->controller, 'You must <a href="register">registered</a> and logged in to edit your profile');
        }
    }

    public function entry()
    {
        $params = $this->getRequest();
        if ($subdomain = $params->param('ID')) {
            $entry = DataObject::get('ServiceEntry')->filter(array('SubDomain' => $subdomain))->first();
            if (!$entry && !Controller::redirectedTo()) {
                $errorPage = DataObject::get_one('ErrorPage');
                Controller::redirect($errorPage->Link(), 404);
            } else {
                Requirements::customScript("
                    function initialize() {
                        var myLatLng = {lat: ".$entry->Lat.", lng: ".$entry->Lng."};
                        var map = new google.maps.Map(document.getElementById('map_canvas'), {
                          zoom: 15,
                          center: myLatLng
                        });
                        var contentString = '<div id=\"content\"><div id=\"bodyContent\"><h4>".$entry->Title."</h4><p>".$entry->Address."</p></div></div>';
                        var infowindow = new google.maps.InfoWindow({
                          content: contentString
                        });
                        var marker = new google.maps.Marker({
                          position: myLatLng,
                          map: map,
                        });
                        infowindow.open(map, marker);
                    }
                    google.maps.event.addDomListener(window, \"load\", initialize);
                ");
                
                return array(
                    'ServiceEntry' => $entry
                );
            }
        }
    }

    public function edit(){
        if(Member::currentUser()){
            $link = $this->Link()."entry/".$this->ServiceForm()->getRecord()->SubDomain;
            return array(
                'Link'=>$link
            );
        }else{
            return Security::PermissionFailure($this->controller, 'You must <a href="register">registered</a> and logged in to edit your profile');
        }

    }

    public function Saved(){
        return $this->request->getVar('saved');
    }

    public function Success(){
        return $this->request->getVar('success');
    }

}