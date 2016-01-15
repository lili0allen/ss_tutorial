<?php
$val .= '


<div class="content">
    <div class="container">
        <div class="row">

            <div class="main col-sm-8">

                <div class="grid-style1 clearfix">
                    ';

$scope->locally()->obj('Regions', null, true); $scope->pushScope(); while (($key = $scope->next()) !== false) {
$val .= '
                    <div class="item col-md-12">
                        <div class="image image-large">
                            <a href="';

$val .= $scope->locally()->XML_val('Link', null, true);
$val .= '">
                                <span class="btn btn-default"><i class="fa fa-file-o"></i> Read More</span>
                            </a>
                            ';

$val .= $scope->locally()->obj('Photo', null, true)->XML_val('CroppedImage', array('720', '255'), true);
$val .= '
                        </div>
                        <div class="info-blog">
                            <h3>
                                <a href="';

$val .= $scope->locally()->XML_val('Link', null, true);
$val .= '">';

$val .= $scope->locally()->XML_val('Title', null, true);
$val .= '</a>
                            </h3>
                            <p>';

$val .= $scope->locally()->XML_val('Description', null, true);
$val .= '</p>
                        </div>
                    </div>
                    ';


}; $scope->popScope(); 
$val .= '
                </div>


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

            </div>


            <div class="sidebar gray col-sm-4">

                <h2 class="section-title">Popular articles</h2>
                <ul class="latest-news">
                    <li class="col-md-12">
                        <div class="image">
                            <a href="blog-detail.html"></a>
                            <img src="http://placehold.it/100x100" alt=""/>
                        </div>
                        <ul class="top-info">
                            <li><i class="fa fa-calendar"></i> 30 July 2014</li>
                        </ul>
                        <h4><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">It\'s all about the Northeast</a></h4>
                    </li>
                    <li class="col-md-12">
                        <div class="image">
                            <a href="blog-detail.html"></a>
                            <img src="http://placehold.it/100x100" alt=""/>
                        </div>
                        <ul class="top-info">
                            <li><i class="fa fa-calendar"></i> 20 July 2014</li>
                        </ul>
                        <h4><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Southwest: Best ever</a></h4>
                    </li>
                    <li class="col-md-12">
                        <div class="image">
                            <a href="blog-detail.html"></a>
                            <img src="http://placehold.it/100x100" alt=""/>
                        </div>
                        <ul class="top-info">
                            <li><i class="fa fa-calendar"></i> 10 July 2014</li>
                        </ul>
                        <h4><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">I went to the Northwest and stole from and old lady</a></h4>
                    </li>
                </ul>

            </div>

        </div>
    </div>
</div>
';

