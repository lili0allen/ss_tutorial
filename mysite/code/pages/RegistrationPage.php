<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 5/17/16
 * Time: 3:53 PM
 */

class RegistrationPage extends Page {

}

class RegistrationPage_Controller extends Page_Controller {

    private static $allowed_actions = array(
        'RegistrationForm'
    );

    public function RegistrationForm(){
        $fields = new FieldList(
            new TextField('Name', 'Name'),
            new EmailField('Email', 'Email'),
            new ConfirmedPasswordField('Password', 'Password')
        );
        $actions = new FieldList(
            new FormAction('doRegister', 'Register')
        );
        $validator = new RequiredFields('Name', 'Email', 'Password');
        return new Form($this, 'RegistrationForm', $fields, $actions, $validator);
    }

    public function doRegister($data, $form){
        if($member = DataObject::get_one("Member","Email = '". Convert::raw2sql($data['Email']) ."'")){
            $form->addErrorMessage('Email', "Sorry, that email address already exists. Please choose another one.", 'bad');
            Session::set("FormInfo.Form_RegistrationForm.data", $data);
            return $this->redirectBack();
        }
        $Member = new Member();
        $form->saveInto($Member);
//        $service = new ServiceEntry();
//        $serviceID = $service->write();
//        $Member->ServiceEntryID = $serviceID;
        $Member->write();
        $Member->logIn();

        if(!$userGroup = DataObject::get_one('Group', "Code = 'serviceowner'")){
            $userGroup = new Group();
            $userGroup->Code = "serviceowner";
            $userGroup->Title = "ServiceOwner";
            $userGroup->write();
            $userGroup->Members()->add($Member);
        }
        $userGroup->Members()->add($Member);

        if($ProfilePage = DataObject::get_one('EditProfilePage')){
            return $this->redirect($ProfilePage->Link('?success=1'));
        }
    }
}