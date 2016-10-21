<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 1/12/16
 * Time: 8:34 AM
 */

class SiteConfigExtension extends DataExtension {

    private static $db = array(
        'HeaderContent' => 'Text',
        'FooterContent' => 'Text'
    );

    private static $has_one = array(
        'Logo' => 'Image'
    );

    public function updateCMSFields(FieldList $fields) {
        $fields->addFieldsToTab('Root.Main', TextareaField::create('HeaderContent', 'Header Content'));
        $fields->addFieldsToTab('Root.Main', TextareaField::create('FooterContent', 'Footer Content'));
        $fields->addFieldToTab('Root.Main', new UploadField("Logo", "Logo"));
    }
} 