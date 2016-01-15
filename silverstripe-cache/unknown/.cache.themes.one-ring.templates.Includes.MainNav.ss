<?php
$val .= '<div id="nav-section">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <a href="';

$val .= $scope->locally()->XML_val('AbsoluteBaseURL', null, true);
$val .= '" class="nav-logo"><img src="';

$val .= $scope->locally()->XML_val('ThemeDir', null, true);
$val .= '/images/logo.png" alt="One Ring Rentals" /></a>

                <!-- BEGIN MAIN MENU -->
                <nav class="navbar">
                    <button id="nav-mobile-btn"><i class="fa fa-bars"></i></button>

                    <ul class="nav navbar-nav">
                        ';

$scope->locally()->obj('Menu', array('1'), true); $scope->pushScope(); while (($key = $scope->next()) !== false) {
$val .= '
                            <li><a class="';

$val .= $scope->locally()->XML_val('LinkingMode', null, true);
$val .= '" href="';

$val .= $scope->locally()->XML_val('Link', null, true);
$val .= '" title="Go to the ';

$val .= $scope->locally()->XML_val('Title', null, true);
$val .= ' page">';

$val .= $scope->locally()->XML_val('MenuTitle', null, true);
$val .= '</a></li>
                        ';


}; $scope->popScope(); 
$val .= '
                    </ul>

                </nav>
                <!-- END MAIN MENU -->

            </div>
        </div>
    </div>
</div>';

