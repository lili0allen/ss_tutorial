<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 1/12/16
 * Time: 8:34 AM
 */

class SiteConfigExtension extends DataExtension {

    private static $db = array(
        'FacebookLink' => 'Varchar',
        'TwitterLink' => 'Varchar',
        'GoogleLink' => 'Varchar',
        'YouTubeLink' => 'Varchar',
        'FooterContent' => 'Text'
    );

    public function updateCMSFields(FieldList $fields) {
        $fields->addFieldsToTab('Root.Social', array(
            TextField::create('FacebookLink', 'Facebook'),
            TextField::create('TwitterLink', 'Twitter'),
            TextField::create('GoogleLink', 'Google'),
            TextField::create('YouTubeLink', 'YouTube'),
        ));
        $fields->addFieldsToTab('Root.Main', TextareaField::create('FooterContent', 'Content for footer'));
    }
} 