<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 5/17/16
 * Time: 3:53 PM
 */

class EditProfilePage extends Page {

}

class EditProfilePage_Controller extends Page_Controller {

    private static $allowed_actions =array(
        'EditProfileForm'
    );

    public function EditProfileForm(){
        $fields = new FieldList(
            new TextField('Name', 'Name'),
            new EmailField('Email', 'Email'),
            new ConfirmedPasswordField('Password', 'New Password')
        );
        $actions = new FieldList(
            new FormAction('SaveProfile', 'Save')
        );
        $validator = new RequiredFields('Name', 'Email');
        $Form = new Form($this, __FUNCTION__, $fields, $actions, $validator);
        if($Member = Member::currentUser()){
            $Form->loadDataFrom($Member->data());
        }

        return $Form;
    }

    public function SaveProfile($data, $form){
        if($CurrentMember = Member::currentUser()){
            if($member = DataObject::get_one('Member', "Email = '". Convert::raw2sql($data['Email']). "' AND ID != ".$CurrentMember->ID)){
                $form->addErrorMessage("Email", "Sorry, that email already exists.", "bad");
                Session::set('FormInfo.Form_EditProfileForm.data', $data);
                return $this->redirectBack();
            }else{
                $form->saveInto($CurrentMember);
                $CurrentMember->write();
                return $this->redirect($this->Link('?saved=1'));
            }
        }else{
            return Security::PermissionFailure($this->controller, 'You must <a href="register">registered</a> and logged in to edit your profile');
        }
    }

    public function EditServiceLinkText(){
        if(Member::currentUser()->ServiceEntryID){
            $serviceLinkText = "Edit my Service";
        }else{
            $serviceLinkText = "Create a Service";
        }
        return $serviceLinkText;
    }

    public function Saved(){
        return $this->request->getVar('saved');
    }

    public function Success(){
        return $this->request->getVar('success');
    }

}