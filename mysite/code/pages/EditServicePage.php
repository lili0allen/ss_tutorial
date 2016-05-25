<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 5/25/16
 * Time: 11:49 AM
 */

class EditServicePage extends Page{

}

class EditServicePage_Controller extends Page_Controller{
    private static $allowed_actions =array(
        'EditServiceForm'
    );

    public function EditServiceForm(){
        $user_ip = (isset($_SERVER['REMOTE_ADDR'])) ? $_SERVER['REMOTE_ADDR'] : "";
        $fields = new FieldList(
            TextField::create('Title', 'Title'),
            TextField::create('SubDomain', 'SubDomain'),
            TextField::create('Street', 'Street'),
            TextField::create('Suburb', 'Suburb'),
            DropdownField::create("State", "State", singleton('ServiceEntry')->dbObject('State')->enumValues()),
            CheckboxSetField::create('Service', 'Service', DynamicList::get_dynamic_list('ServiceType')->itemArray()),
            TextareaField::create('Description', 'Description'),
            EmailField::create('Email', 'Email'),
            TextField::create('Phone', 'Phone'),
            TextField::create('Wechat', 'Wechat'),
            TextField::create('QQ', 'QQ'),
            TextField::create('Website', 'Website'),
            HtmlEditorField::create('Content', 'Content'),
            CheckboxField::create("Terms", "Terms & Conditions")->setAttribute("required", true)->addExtraClass("required"),
            HiddenField::create('IPAddress', 'IPAddress', $user_ip)
        );
        $fields->push($logo = FileField::create("Logo", "Logo"));
        $logo->setAttribute('size', 30);
        $logo->getValidator()->setAllowedExtensions(array('jpg', 'jpeg', 'png', 'gif'));

        $fields->push($imageGallery = FileField::create("Images[]", "Image Gallery"));
        $imageGallery->setAttribute('size', 30);
        $imageGallery->getValidator()->setAllowedExtensions(array('jpg', 'jpeg', 'png', 'gif'));

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
            return $this->redirect($this->Link('?saved=1'));
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