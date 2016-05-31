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
        'ServiceForm','edit','submit','entry','entries'
    );

    public function init() {
        parent::init();
        Requirements::javascript('//cdn.tinymce.com/4/tinymce.min.js');
        Requirements::customScript("tinymce.init({selector: '#Content textarea'});");
    }

    public function ServiceForm(){
        $user_ip = (isset($_SERVER['REMOTE_ADDR'])) ? $_SERVER['REMOTE_ADDR'] : "";
        $fields = new FieldList(
            TextField::create('Title', 'Title')
                ->addExtraClass('form-control required'),
            TextField::create('SubDomain', 'SubDomain')
                ->addExtraClass('form-control required'),
            TextField::create('Street', 'Street')
                ->addExtraClass('form-control required'),
            TextField::create('Suburb', 'Suburb')
                ->addExtraClass('form-control required'),
            DropdownField::create("State", "State", singleton('ServiceEntry')->dbObject('State')->enumValues())
                ->addExtraClass('form-control required'),
            CheckboxSetField::create('Service', 'Service', DynamicList::get_dynamic_list('ServiceType')->itemArray())
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

    public function submit(){
        return array();
    }

    public function entry(){

        return array(
            'ServiceEntry'=>DataObject::get_by_id('ServiceEntry',$this->getRequest()->param('ID'))
        );

    }

    public function edit(){
        return array();
    }

    public function entries(){
        return array();
    }

    public function Saved(){
        return $this->request->getVar('saved');
    }

    public function Success(){
        return $this->request->getVar('success');
    }
}