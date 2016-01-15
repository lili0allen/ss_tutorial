<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 1/13/16
 * Time: 8:16 AM
 */

class Property extends DataObject {

    private static $db = array(
        'Title' => 'Varchar',
        'PricePerNight' => 'Currency',
        'Bedrooms' => 'Int',
        'Bathrooms' => 'Int',
        'FeaturedOnHomepage' => 'Boolean'
    );

    private static $has_one = array(
        'Region' => 'Region',
        'PrimaryPhoto' => 'Image'
    );

    public function getCMSfields(){
        $fields = FieldList::create(TabSet::create('Root'));
        $fields->addFieldsToTab('Root.Main', array(
            TextField::create('Title'),
            CurrencyField::create('PricePerNight', 'Price (per night)'),
            DropdownField::create('Bedrooms')
                ->setSource(ArrayLib::valuekey(range(1,10))),
            DropdownField::create('Bathrooms')
                ->setSource(ArrayLib::valuekey(range(1,10))),
            DropdownField::create('RegionID', 'Region')
                ->setSource(Region::get()->map('ID', 'Title'))
                ->setEmptyString('(Select one)'),
            CheckboxField::create('FeaturedOnHomepage', 'Feature on homepage')
        ));
        $fields->addFieldToTab('Root.Photos', $upload = UploadField::create('PrimaryPhoto', 'Primary photo'));
        $upload->getValidator()->setAllowedExtensions(array('png', 'jpeg', 'jpg', 'gif'));
        $upload->setFolderName('property-photos');

        return $fields;
    }

    private static $summary_fields = array(
        'Title' => 'Title',
        'Region.Title' => 'Region',
        'PricePerNight.Nice' => 'Price',
        'FeaturedOnHomepage.Nice' => 'Featured?'
    );

    public function searchableFields(){
        return array(
            'Title' => array(
                'filter' => 'PartialMatchFilter',
                'title' => 'Title',
                'field' => 'TextField'
            ),
            'RegionID' => array (
                'filter' => 'ExactMatchFilter',
                'title' => 'Region',
                'field' => DropdownField::create('RegionID')
                        ->setSource(
                            Region::get()->map('ID','Title')
                        )
                        ->setEmptyString('-- Any region --')
            ),
            'FeaturedOnHomepage' => array (
                'filter' => 'ExactMatchFilter',
                'title' => 'Only featured'
            )
        );
    }
} 