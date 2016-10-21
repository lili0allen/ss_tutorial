<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 1/12/16
 * Time: 8:34 AM
 */

class DynamicListItemExtension extends DataExtension {

    private static $db = array(
        'Icon' => 'Text',
        'Link' => 'Text'
    );

    private static $has_one = array(
        'Thumbnail' => 'Image'
    );

    public function updateCMSFields(FieldList $fields) {
        $fields->addFieldsToTab('Root.Main', TextField::create('Icon', 'Icon'));
        $fields->addFieldsToTab('Root.Main', TextField::create('Link', 'Link'));
        $fields->addFieldToTab('Root.Main', new UploadField("Thumbnail", "Thumbnail"));
    }
} 