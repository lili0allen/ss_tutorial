<?php
if ($scope->locally()->hasValue('Pages', null, true)) { 
$val .= '
	';

$scope->locally()->obj('Pages', null, true); $scope->pushScope(); while (($key = $scope->next()) !== false) {
$val .= '
		';

if ($scope->locally()->hasValue('Last', null, true)) { 
$val .= $scope->locally()->obj('MenuTitle', null, true)->XML_val('XML', null, true);

}else { 
$val .= '<a href="';

$val .= $scope->locally()->XML_val('Link', null, true);
$val .= '" class="breadcrumb-';

$val .= $scope->locally()->XML_val('Pos', null, true);
$val .= '">';

$val .= $scope->locally()->obj('MenuTitle', null, true)->XML_val('XML', null, true);
$val .= '</a> &raquo;';


}
$val .= '
	';


}; $scope->popScope(); 
$val .= '
';


}
$val .= '
';

