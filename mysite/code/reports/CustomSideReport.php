<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 3/2/16
 * Time: 9:36 AM
 */

class CustomSideReport_AllPages extends SS_Report {

    public function title(){
        return 'All Pages';
    }

    public function sourceRecords($params = null){
        return Page::get()->sort('Title');
    }

    public function columns(){
        $fields = array(
            'Title' => 'Title'
        );

        return $fields;
    }
}

class CustomSideReport_ArticlePages extends SS_Report {

    public function title(){
        return 'Article Pages';
    }

    public function sourceRecords($params = null){
        return ArticlePage::get()->sort('Title');
    }

    public function columns(){
        $fields = array(
            'Title' => 'Title'
        );

        return $fields;
    }
}