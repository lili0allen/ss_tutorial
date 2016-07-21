<?php

/**
 * Created by PhpStorm.
 * User: dev
 * Date: 7/21/16
 * Time: 2:17 PM
 */
class WishlistPage extends Page
{

}

class WishlistPage_Controller extends Page_Controller
{
    private static $allowed_actions = array(
        'index'
    );

    public function index(){
        $list = Cookie::get("wishlist");
        if($list){
            $arrayList = explode(",",$list);
            $entries = ServiceEntry::get()->filter('ID', $arrayList);
            return array(
                'ServiceEntries' => $entries
            );
        }else{

        }
    }
}