<?php
$val .= '<div class="block_area block_area_';

$val .= $scope->locally()->obj('AreaID', null, true)->XML_val('LowerCase', null, true);
$val .= '" data-areaid="';

$val .= $scope->locally()->XML_val('AreaID', null, true);
$val .= '">
	';

$scope->locally()->obj('BlockArea', null, true); $scope->pushScope(); while (($key = $scope->next()) !== false) {
$val .= '
		';

$val .= $scope->locally()->XML_val('BlockHTML', null, true);
$val .= '
	';


}; $scope->popScope(); 
$val .= '
</div>';

