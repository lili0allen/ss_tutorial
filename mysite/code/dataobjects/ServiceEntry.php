<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 5/17/16
 * Time: 2:23 PM
 */

class ServiceEntry extends DataObject {
    private static $db = array(
        'Title'     =>  'Varchar(100)',
        'SubDomain' => 'Varchar(100)',
        'Street'    => 'Varchar(100)',
        'Suburb'    => 'Varchar(100)',
        'State'     => 'Enum("Victoria,New South Wales,Tasmania,Australian Capital Territory,Queensland,Western Australia,Northern Territory,South Australia")',
        'Service'   => 'Varchar(100)',
        'Description' => 'Text',
        'Email'     =>  'Varchar(100)',
        'Phone'     =>  'Varchar(100)',
        'Wechat'    =>  'Varchar(100)',
        'QQ'        =>  'Varchar(100)',
        'Website'   =>  'Varchar(100)',
        'Content'   =>  'HTMLText'
    );
    private static $has_one = array(
        'Logo'  =>  'Image'
    );
} 