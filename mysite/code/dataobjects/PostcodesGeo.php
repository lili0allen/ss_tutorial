<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 7/14/16
 * Time: 2:56 PM
 */

class PostcodesGeo extends DataObject{
    private static $db = array(
        "Postcode" => "Varchar(5)",
        "Suburb"   => "Varchar(100)",
        "State"    => "Varchar(4)",
        "Latitude" => "Decimal(6,3)",
        "Longitude"=> "Decimal(6,3)"
    );

    private static $api_access = true;

    private static $searchable_fields = array(
        'Postcode'
    );
}