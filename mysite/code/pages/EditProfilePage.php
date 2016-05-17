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
        $Form = new Form($this, 'EditProfileForm', $fields, $actions, $validator);
        $Member = Member::currentUser();
        $Form->loadDataFrom($Member->data());

        return $Form;
    }
}