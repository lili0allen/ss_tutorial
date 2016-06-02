<?php

global $project;
$project = 'mysite';

global $databaseConfig;
$databaseConfig = array(
	"type" => 'MySQLDatabase',
	"server" => '127.0.0.1',
	"username" => 'root',
	"password" => 'password',
	"database" => 'handy_service',
	"path" => '',
);

// Set the site locale
i18n::set_locale('en_US');
//Security::SetDefaultAdmin('admin', 'admin');

if(Director::isLive()) {
    SS_Log::add_writer(new SS_LogEmailWriter('allen@easymode.com.au'), SS_Log::ERR);
}else{
    //isTest or isDev
    SS_Log::add_writer(new SS_LogFileWriter('../silverstripe-errors-warnings.log'), SS_Log::WARN, '<=');
    SS_Log::add_writer(new SS_LogFileWriter('../silverstripe-errors.log'), SS_Log::ERR);

}

SS_Cache::set_cache_lifetime('any', -1, 100);

session_save_path('/tmp');
Security::setDefaultAdmin('admin', 'admin');


ShortcodeParser::get('default')->register('googlemap', function($arguments, $address, $parser, $shortcode) {
    $iframeUrl = sprintf(
        'http://maps.google.com/maps?q=%s&amp;hnear=%s&amp;ie=UTF8&hq=&amp;t=m&amp;z=14&amp;output=embed',
        urlencode($address),
        urlencode($address)
    );

    $width = (isset($arguments['width']) && $arguments['width']) ? $arguments['width'] : 400;
    $height = (isset($arguments['height']) && $arguments['height']) ? $arguments['height'] : 300;

    return sprintf(
        '<iframe width="%d" height="%d" src="%s" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>',
        $width,
        $height,
        $iframeUrl
    );
});