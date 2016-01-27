<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 1/4/16
 * Time: 8:07 AM
 */

class ArticleCategory extends DataObject {

    private static $db = array (
        'Title' => 'Varchar',
    );

    private static $has_one = array (
        'ArticleHolder' => 'ArticleHolder'
    );

    private static $belongs_many_many =array(
        'Articles' => 'ArticlePage'
    );

    public function getCMSFields(){
        return FieldList::create(
            TextField::create('Title')
        );
    }

    public function Link(){
        return $this->ArticleHolder()->Link(
            'category/'.$this->ID
        );
    }

} 