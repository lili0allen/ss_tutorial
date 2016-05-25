<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 5/24/16
 * Time: 3:34 PM
 */

class ServiceAdmin extends ModelAdmin{
    private static $menu_title = 'Services';
    private static $url_segment = 'services';
    private static $managed_models = array(
        'ServiceEntry'
    );
}