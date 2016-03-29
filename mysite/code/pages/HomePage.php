<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 12/7/15
 * Time: 8:32 AM
 */

class HomePage extends Page {
    private static $has_many =array(
        'Slides' => 'Slide'
    );

    public function getCMSFields(){
        $fields = parent::getCMSFields();
        $fields->addFieldsToTab('Root.Slider', GridField::create(
            'Slides',
            'Slides',
            $this->Slides(),
            GridFieldConfig_RecordEditor::create()
        ));
        return $fields;
    }
}

class HomePage_Controller extends Page_Controller {

    public function LatestArticles($count =3) {
        return ArticlePage::get()
                    ->sort('Created', 'DESC')
                    ->limit($count);
    }

    public function FeaturedProperties(){
        return Property::get()
                    ->filter(array(
                        'FeaturedOnHomepage' => true
                        ))
                    ->limit(6);
    }

    public function PropertySearchForm(){
        return PropertySearchPage_Controller::create()->PropertySearchForm();
    }

    public function PopularRegions(){
        return Region::get()
                    ->filter(array(
                        'PopularOnHomepage' => true
                        ))
                    ->limit(6);
    }
}