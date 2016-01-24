<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 12/7/15
 * Time: 10:19 AM
 */

class ArticleHolder extends Page {
    private static $allowed_children = array ('ArticlePage');

    private static $has_many = array (
        'Categories' => 'ArticleCategory'
    );

    public function getCMSFields(){
        $fields = parent::getCMSFields();
        $fields->addFieldsToTab('Root.Categories', GridField::create(
            'Categories',
            'Article categories',
            $this->Categories(),
            GridFieldConfig_RecordEditor::create()
        ));
        return $fields;
    }

    public function Regions(){
        $page = RegionsPage::get()->first();
        if($page){
            return $page->Regions();
        }
    }

}

class ArticleHolder_Controller extends Page_Controller {

}