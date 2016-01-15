<?php
$val .= '
<!-- BEGIN PAGE TITLE/BREADCRUMB -->
';

$val .= SSViewer::execute_template('Banner', $scope->getItem(), array(), $scope);

$val .= '
<!-- END PAGE TITLE/BREADCRUMB -->


<!-- BEGIN CONTENT -->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="main col-sm-8">
                ';

$val .= $scope->locally()->XML_val('Content', null, true);
$val .= '
                ';

$val .= $scope->locally()->XML_val('Form', null, true);
$val .= '
            </div>

            <div class="sidebar gray col-sm-4">
                ';

$val .= $scope->locally()->XML_val('BlockArea', array('Sidebar'), true);
$val .= '
                ';

if ($scope->locally()->hasValue('Menu', array('2'), true)) { 
$val .= '
                    <h2 class="section-title">In this section</h2>
                    <ul class="categories subnav">
                        ';

$scope->locally()->obj('Menu', array('2'), true); $scope->pushScope(); while (($key = $scope->next()) !== false) {
$val .= '
                            <li><a class="';

$val .= $scope->locally()->XML_val('LinkingMode', null, true);
$val .= '" href="';

$val .= $scope->locally()->XML_val('Link', null, true);
$val .= '">';

$val .= $scope->locally()->XML_val('MenuTitle', null, true);
$val .= '</a></li>
                        ';


}; $scope->popScope(); 
$val .= '
                    </ul>
                ';


}
$val .= '
            </div>
        </div>
    </div>
</div>
<!-- END CONTENT -->


';

