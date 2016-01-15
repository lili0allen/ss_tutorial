<?php
$val .= '


<div class="content">
    <div class="container">
        <div class="row">

            <div class="main col-sm-8">

                ';

$scope->locally()->obj('Region', null, true); $scope->pushScope();
$val .= '
                    <div class="blog-main-image">
                        ';

$val .= $scope->locally()->obj('Photo', null, true)->XML_val('SetWidth', array('750'), true);
$val .= '
                    </div>
                    ';

$val .= $scope->locally()->XML_val('Description', null, true);
$val .= '
                ';


; $scope->popScope(); 
$val .= '

            </div>


            <div class="sidebar gray col-sm-4">
                <h2 class="section-title">Regions</h2>
                <ul class="categories subnav">
                    ';

$scope->locally()->obj('Regions', null, true); $scope->pushScope(); while (($key = $scope->next()) !== false) {
$val .= '
                        <li class="';

$val .= $scope->locally()->XML_val('LinkingMode', null, true);
$val .= '"><a class="';

$val .= $scope->locally()->XML_val('LinkingMode', null, true);
$val .= '" href="';

$val .= $scope->locally()->XML_val('Link', null, true);
$val .= '">';

$val .= $scope->locally()->XML_val('Title', null, true);
$val .= '</a></li>
                    ';


}; $scope->popScope(); 
$val .= '
                </ul>
            </div>

        </div>
    </div>
</div>
';

