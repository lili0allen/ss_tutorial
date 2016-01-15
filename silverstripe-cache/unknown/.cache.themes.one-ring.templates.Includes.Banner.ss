<?php
$val .= '<div class="parallax colored-bg pattern-bg">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1 class="page-title">';

$val .= $scope->locally()->XML_val('Title', null, true);
$val .= '</h1>

                <div class="breadcrumb">
                    ';

$val .= $scope->locally()->XML_val('Breadcrumbs', null, true);
$val .= '
                </div>
            </div>
        </div>
    </div>
</div>';

