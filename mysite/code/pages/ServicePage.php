<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 5/25/16
 * Time: 11:49 AM
 */

class ServicePage extends Page{

}

class ServicePage_Controller extends Page_Controller{
    private static $allowed_actions =array(
        'ServiceForm','search','edit','entry'
    );

    public function index(SS_HTTPRequest $request){
        $filters = ArrayList::create();
        $entries = ArrayList::create();

        if($service = $request->getVar('Service')){
            $filters->push(ArrayData::create(array(
                'Label' => "Service: '$service'",
                'RemoveLink' => HTTP::setGetVar('Service', null)
            )));
        }

        if($distance = $request->getVar('Distance')){
            $filters->push(ArrayData::create(array(
                'Label' => "Distance: '$distance'",
                'RemoveLink' => HTTP::setGetVar('Distance', null)
            )));
            $distance = pow($distance*0.621371,2);
        }

        if($postcode = $request->getVar('Postcode')){
            $filters->push(ArrayData::create(array(
                'Label' => "Postcode: '$postcode'",
                'RemoveLink' => HTTP::setGetVar('Postcode', null)
            )));
        }

        if($postcode && $service && $distance) {

            $latlng = DB::query("
                SELECT Latitude, Longitude FROM PostcodesGeo where CONCAT(Suburb, ' ', Postcode, ', ', State) = '$postcode';
            ")->record();

            $result = DB::query("
                SELECT ID,
                    POW(69.1 * (Lat - ".$latlng['Latitude']."), 2) +
                    POW(69.1 * (".$latlng['Longitude']." - Lng) * COS(Lat / 57.3), 2) AS distance
                FROM ServiceEntry WHERE ServiceValue LIKE '%\"$service\"%' HAVING distance < $distance ORDER BY distance;
            ");
            while ($record = $result->record()) {
                $entries->add(DataObject::get_by_id('ServiceEntry',$record['ID']));
            }
            $pagenatedEntries = PaginatedList::create($entries, $request)->setPageLength(3);

            $data = array(
                'ServiceEntries' => $pagenatedEntries
            );

            if($request->isAjax()){
                return $this->customise($data)->renderWith('SearchResults');
            }
            return $data;
        }else{
            return array();
        }

    }
    
    public function SearchForm(){
        $fields = new FieldList(
            DropdownField::create('Service', 'Service', DynamicList::get_dynamic_list('ServiceType')->itemArray())
                ->setEmptyString('选择服务类型')
                ->addExtraClass('form-control'),
            TextField::create('Postcode', 'Postcode')
                ->setAttribute('data-provide', 'typeahead')
                ->setAttribute('autocomplete', 'off')
                ->setAttribute('placeholder', '邮编')
                ->addExtraClass('form-control typeahead'),
            HiddenField::create('Distance', 's', 50)
                ->addExtraClass('form-control')
        );
        $actions = new FieldList(
            FormAction::create('SearchEntries', 'Search')->addExtraClass('btn btn-primary btn-block')
        );
        $validator = new RequiredFields('Service', 'Postcode','Distance');
        $Form = new Form($this, __FUNCTION__, $fields, $actions, $validator);
        $Form->setFormMethod('GET')
            ->setFormAction($this->Link())//post to index()
            ->disableSecurityToken()
            ->loadDataFrom($this->request->getVars());
        return $Form;
    }

    public function ServiceForm(){
        $user_ip = (isset($_SERVER['REMOTE_ADDR'])) ? $_SERVER['REMOTE_ADDR'] : "";
        $fields = new FieldList(
            TextField::create('Name', '名称')
                ->addExtraClass('form-control required'),
            TextField::create('Domain', '子域名')
                ->addExtraClass('form-control required'),
            TextField::create('Address', '地址')
                ->addExtraClass('form-control required')
                ->setAttribute('placeholder', '如果无法提供精确地址，可以用suburb名称代替'),
            MultiValueCheckboxFieldBS::create('Service', '服务类型', DynamicList::get_dynamic_list('ServiceType')->itemArray())
                ->addExtraClass('required'),
            TextareaField::create('Description', '描述')
                ->addExtraClass('form-control required'),
            EmailField::create('Email', '邮箱')
                ->addExtraClass('form-control required'),
            TextField::create('Phone', '电话')
                ->addExtraClass('form-control required'),
            HtmlEditorField::create('Content', '详细内容')
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
            FormAction::create('SaveService', 'Save')->addExtraClass('btn btn-primary')
        );
        $validator = new RequiredFields('Title', 'Domain','State');
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
        Requirements::javascript('https://maps.googleapis.com/maps/api/js?key=AIzaSyCwlMt5FInggZeqhh1HQrUcyFDwGXDcsBo&libraries=places');
        $params = $this->getRequest();
        if ($domain = $params->param('ID')) {
            $entry = DataObject::get('ServiceEntry')->filter(array('Domain' => $domain))->first();
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
            Requirements::javascript('//cdn.tinymce.com/4/tinymce.min.js');
            Requirements::customScript("tinymce.init({selector: '#Content textarea'});");
            Requirements::javascript('https://maps.googleapis.com/maps/api/js?key=AIzaSyCwlMt5FInggZeqhh1HQrUcyFDwGXDcsBo&libraries=places');
            if(Member::currentUser()->ServiceEntryID){
                $link = $this->Link()."entry/".$this->ServiceForm()->getRecord()->Domain;
                return array(
                    'Link'=>$link
                );
            }else{
                return array();
            }

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