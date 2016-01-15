<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 1/6/16
 * Time: 8:05 AM
 */

class ArticleComment extends DataObject {

    private static $db = array(
        'Name' => 'Varchar',
        'Email' => 'Varchar',
        'Comment' => 'Text'
    );

    private static $has_one = array(
        'ArticlePage' => 'ArticlePage'
    );
} 