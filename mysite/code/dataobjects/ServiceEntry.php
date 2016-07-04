<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 5/17/16
 * Time: 2:23 PM
 */

class ServiceEntry extends DataObject {
    private static $db = array(
        'Title'     =>  'Varchar(100)',
        'SubDomain' => 'Varchar(100)',
        'Address'   => 'Varchar(100)',
        'Suburb'    => 'Varchar(100)',
        'State'     => 'Varchar(100)',
        'Postcode'  => 'Varchar(20)',
        'Service'   => 'MultiValueField',
        'Description' => 'Text',
        'Email'     =>  'Varchar(100)',
        'Phone'     =>  'Varchar(100)',
        'Wechat'    =>  'Varchar(100)',
        'QQ'        =>  'Varchar(100)',
        'Website'   =>  'Varchar(100)',
        'Content'   =>  'HTMLText',
        'Lat'       =>  'Varchar(20)',
        'Lng'       =>  'Varchar(20)',
        'IPAddress' =>  'Varchar(100)',
        'Terms' => 'Boolean',
    );
    private static $has_one = array(
        'Logo'  =>  'Image'
    );

    public function getCMSFields(){
        $fields = parent::getCMSFields();
        $fields->addFieldToTab('Root.Main', MultiValueCheckboxField::create("Service", "Service", DynamicList::get_dynamic_list('ServiceType')->itemArray()),"Description");
        return $fields;
    }

} 