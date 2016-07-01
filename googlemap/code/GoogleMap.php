<?php

/**
 * Created by PhpStorm.
 * User: dev
 * Date: 7/1/16
 * Time: 10:47 AM
 */
class GoogleMap extends DataObject
{
    public static function getLatLng($address="Australia"){
        $url = "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCwlMt5FInggZeqhh1HQrUcyFDwGXDcsBo&sensor=false&address=".urlencode($address);
        $lat_lng = get_object_vars(json_decode(file_get_contents($url)));
        return array(
            'Lat'=>$lat_lng['results'][0]->geometry->location->lat,
            'Lng'=>$lat_lng['results'][0]->geometry->location->lng
        );
    }
}