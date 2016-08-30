<?php

global $project;
$project = 'mysite';

// Set the site locale
i18n::set_locale('en_US');
//Security::SetDefaultAdmin('admin', 'admin');

if(Director::isLive()) {
    SS_Log::add_writer(new SS_LogEmailWriter('allen@easymode.com.au'), SS_Log::ERR);
}else{
    //isTest or isDev
    SS_Log::add_writer(new SS_LogFileWriter('../silverstripe-errors.log'), SS_Log::WARN, '<=');
    SS_Log::add_writer(new SS_LogFileWriter('../silverstripe-errors.log'), SS_Log::ERR);
}

SS_Cache::set_cache_lifetime('any', -1, 100);

session_save_path('/tmp');
Security::setDefaultAdmin('admin', 'admin');