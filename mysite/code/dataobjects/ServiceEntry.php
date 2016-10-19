<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 5/17/16
 * Time: 2:23 PM
 */

class ServiceEntry extends DataObject {
    private static $db = array(
        'Name'     =>  'Varchar(100)',
        'Domain' => 'Varchar(100)',//optional
        'Address'   => 'Varchar(100)',
        'City'   => 'MultiValueField',
        'Suburb'    => 'Varchar(100)',//hidden
        'State'     => 'Varchar(100)',//hidden
        'Postcode'  => 'Varchar(20)',//hidden
        'Service'   => 'MultiValueField',
        'Description' => 'Text',
        'Email'     =>  'Varchar(100)',
        'Phone'     =>  'Varchar(100)',
        'Content'   =>  'HTMLText',
        'Lat'       =>  'Varchar(20)',//hidden
        'Lng'       =>  'Varchar(20)',//hidden
        'IPAddress' =>  'Varchar(100)',//hidden
        'Terms' => 'Boolean',
    );
    private static $has_one = array(
        'Logo'  =>  'Image'
    );

    public function getCMSFields(){
        $fields = parent::getCMSFields();
        $fields->addFieldToTab('Root.Main', MultiValueCheckboxField::create("Service", "Service", DynamicList::get_dynamic_list('ServiceType')->itemArray()),"Description");
        $fields->addFieldToTab('Root.Main', MultiValueCheckboxField::create("City", "City", DynamicList::get_dynamic_list('City')->itemArray()),"Description");
        return $fields;
    }

    public function Link(){
        $servicePage = DataObject::get_one('ServicePage');
        return $servicePage->Link().'entry/'.$this->Domain;

    }

} 