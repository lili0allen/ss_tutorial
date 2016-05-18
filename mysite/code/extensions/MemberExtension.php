<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 5/18/16
 * Time: 9:21 AM
 */

class MemberExtension extends DataExtension{
    private static $has_one = array(
        'ServiceEntry' => 'ServiceEntry'
    );

    public function Link(){
        if($ProfilePage = DataObject::get_one('EditProfilePage')){
            return $ProfilePage->Link();
        }
    }
}