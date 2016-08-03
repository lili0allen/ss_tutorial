<?php

global $_FILE_TO_URL_MAPPING;
$_FILE_TO_URL_MAPPING[dirname(__FILE__)] = 'http://ss.dev/';

global $databaseConfig;
$databaseConfig = array(
    "type" => 'MySQLDatabase',
    "server" => '127.0.0.1',
    "username" => 'root',
    "password" => 'password',
    "database" => 'handy_service',
    "path" => '',
);