<?php
$val .= SSViewer::execute_template('Banner', $scope->getItem(), array(), $scope);

$val .= '


<!-- BEGIN CONTENT WRAPPER -->
<div class="content">
<div class="container">
<div class="row">

<!-- BEGIN MAIN CONTENT -->
<div class="main col-sm-8">


    <div id="blog-listing" class="list-style clearfix">
        <div class="row">
            ';

$scope->locally()->obj('Children', null, true); $scope->pushScope(); while (($key = $scope->next()) !== false) {
$val .= '
            <div class="item col-md-6">
                <div class="image">
                    <a href="';

$val .= $scope->locally()->XML_val('Link', null, true);
$val .= '">
                        <span class="btn btn-default">Read More</span>
                    </a>
                    ';

$val .= $scope->locally()->obj('Photo', null, true)->XML_val('CroppedImage', array('242', '156'), true);
$val .= '
                </div>
                <div class="tag"><i class="fa fa-file-text"></i></div>
                <div class="info-blog">
                    <ul class="top-info">
                        <li><i class="fa fa-calendar"></i> ';

$val .= $scope->locally()->obj('Date', null, true)->XML_val('Full', null, true);
$val .= '</li>
                        <li><i class="fa fa-comments-o"></i> 2</li>
                        <li><i class="fa fa-tags"></i> ';

$val .= $scope->locally()->XML_val('CategoriesList', null, true);
$val .= '</li>
                    </ul>
                    <h3>
                        <a href="';

$val .= $scope->locally()->XML_val('Link', null, true);
$val .= '">';

$val .= $scope->locally()->XML_val('Title', null, true);
$val .= '</a>
                    </h3>
                    <p>';

$val .= $scope->locally()->XML_val('Teaser', null, true);
$val .= '</p>
                </div>
            </div>
            ';


}; $scope->popScope(); 
$val .= '




        </div>

    </div>


    <!-- BEGIN PAGINATION -->
    <div class="pagination">
        <ul id="previous">
            <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#"><i class="fa fa-chevron-left"></i></a></li>
        </ul>
        <ul>
            <li class="active"><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">1</a></li>
            <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">2</a></li>
            <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">3</a></li>
            <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">4</a></li>
        </ul>
        <ul id="next">
            <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#"><i class="fa fa-chevron-right"></i></a></li>
        </ul>
    </div>
    <!-- END PAGINATION -->

</div>
<!-- END MAIN CONTENT -->


<!-- BEGIN SIDEBAR -->
<div class="sidebar gray col-sm-4">

    <h2 class="section-title">Categories</h2>
    <ul class="categories">
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Business <span>(2)</span></a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Commercial <span>(1)</span></a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Land <span>(3)</span></a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Loans <span>(2)</span></a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">News and Updates <span>(6)</span></a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Properties for Sale <span>(1)</span></a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Real Estate <span>(1)</span></a></li>
    </ul>

    <!-- BEGIN ARCHIVES ACCORDION -->
    <h2 class="section-title">Archives</h2>
    <div id="accordion" class="panel-group blog-accordion">
        <div class="panel">
            <div class="panel-heading">
                <div class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#collapseOne" class="">
                        <i class="fa fa-chevron-right"></i> 2014 (15)
                    </a>
                </div>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                    <ul>
                        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">July (3)</a></li>
                        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">June (4)</a></li>
                        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">May (1)</a></li>
                        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">April (2)</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="panel">
            <div class="panel-heading">
                <div class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#collapseTwo" class="collapsed">
                        <i class="fa fa-chevron-right"></i> 2013 (6)
                    </a>
                </div>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                    <ul>
                        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">May (1)</a></li>
                        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">April (2)</a></li>
                        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">March (1)</a></li>
                        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">February (2)</a></li>
                        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">January (1)</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="panel">
            <div class="panel-heading">
                <div class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#collapseThree" class="collapsed">
                        <i class="fa fa-chevron-right"></i> 2012 (5)
                    </a>
                </div>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">
                    <ul>
                        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">April (1)</a></li>
                        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">March (1)</a></li>
                        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">February (2)</a></li>
                        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">January (1)</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- END  ARCHIVES ACCORDION -->


    <!-- BEGIN TAGS -->
    <h2 class="section-title">Tags</h2>
    <ul class="tags col-sm-12">
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Apartments</a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Residential</a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">News</a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Real estate</a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Land</a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Business</a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Villas</a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Loans</a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Commercial</a></li>
        <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Rent</a></li>
    </ul>
    <!-- BEGIN TAGS -->


    <!-- BEGIN LATEST NEWS -->
    <h2 class="section-title">Latest News</h2>
    <ul class="latest-news">
        <li class="col-md-12">
            <div class="image">
                <a href="blog-detail.html"></a>
                <img src="http://placehold.it/100x100" alt="" />
            </div>

            <ul class="top-info">
                <li><i class="fa fa-calendar"></i> July 30, 2014</li>
            </ul>

            <h3><a href="blog-detail.html">How to get your dream property for the best price?</a></h3>
        </li>
        <li class="col-md-12">
            <div class="image">
                <a href="blog-detail.html"></a>
                <img src="http://placehold.it/100x100" alt="" />
            </div>

            <ul class="top-info">
                <li><i class="fa fa-calendar"></i> July 24, 2014</li>
            </ul>

            <h3><a href="blog-detail.html">7 tips to get the best mortgage.</a></h3>
        </li>
        <li class="col-md-12">
            <div class="image">
                <a href="blog-detail.html"></a>
                <img src="http://placehold.it/100x100" alt="" />
            </div>

            <ul class="top-info">
                <li><i class="fa fa-calendar"></i> July 05, 2014</li>
            </ul>

            <h3><a href="blog-detail.html">House, location or price: What\'s the most important factor?</a></h3>
        </li>
    </ul>
    <!-- END LATEST NEWS -->

</div>
<!-- END SIDEBAR -->

</div>
</div>
</div>
';

