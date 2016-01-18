<?php

global $project;
$project = 'mysite';

global $databaseConfig;
$databaseConfig = array(
	"type" => 'MySQLDatabase',
	"server" => '127.0.0.1',
	"username" => 'root',
	"password" => 'password',
	"database" => 'ss_official',
	"path" => '',
);

// Set the site locale
i18n::set_locale('en_US');
//Security::SetDefaultAdmin('admin', 'admin');

if(!Director::isDev()) {
    // log errors and warnings
    SS_Log::add_writer(new SS_LogFileWriter('../silverstripe-errors-warnings.log'), SS_Log::WARN, '<=');

    // or just errors
    SS_Log::add_writer(new SS_LogFileWriter('../silverstripe-errors.log'), SS_Log::ERR);

    // or notices (e.g. for Deprecation Notifications)
    SS_Log::add_writer(new SS_LogFileWriter('../silverstripe-errors-notices.log'), SS_Log::NOTICE);
}

session_save_path('/tmp');
Security::setDefaultAdmin('admin', 'admin');