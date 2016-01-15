<?php
$val .= '<!DOCTYPE html>
    <!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
    <!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
    <!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
    <!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
    <head>

        ';

$val .= $scope->locally()->XML_val('MetaTags', array('false'), true);
$val .= '
        <title>One Ring Rentals: ';

$val .= $scope->locally()->XML_val('Title', null, true);
$val .= '</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

        ';

$val .= SSViewer::get_base_tag($val);
$val .= '

        <!-- IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>
    <body>

        <div id="wrapper">

            <header id="header">
                ';

$val .= SSViewer::execute_template('TopBar', $scope->getItem(), array(), $scope);

$val .= '
                ';

$val .= SSViewer::execute_template('MainNav', $scope->getItem(), array(), $scope);

$val .= '
            </header>

            ';

$val .= $scope->locally()->XML_val('Layout', null, true);
$val .= '

            ';

$val .= SSViewer::execute_template('Footer', $scope->getItem(), array(), $scope);

$val .= '

        </div>

    </body>
</html>';

