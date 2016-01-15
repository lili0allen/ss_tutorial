<?php
$val .= '<!-- BEGIN HOME SLIDER SECTION -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    </ol> -->

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active"id="slide1" style="background: url(http://placehold.it/1920x605) no-repeat left center; background-size: cover;"> <!-- Ready for JS Injection -->
            <div class="carousel-caption">
                <div class="caption sfr slider-title">Breathtaking views</div>
                <div class="caption sfl slider-subtitle">Relaxation in the Bay of Belfalas</div>
                <a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#" class="caption sfb btn btn-default btn-lg">Learn More</a>
            </div>
        </div>
        <div class="item" id="slide2" style="background: url(http://placehold.it/1920x605) no-repeat left center; background-size: cover;">
            <div class="carousel-caption">
                <div class="caption sfr slider-title">The simple life</div>
                <div class="caption sfl slider-subtitle">Lush gardens in Mordor</div>
                <a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#" class="caption sfb btn btn-default btn-lg">Learn More</a>
            </div>
        </div>
    </div>
    <!-- Blue Filter -->
    <div id="home-search-section"></div>

    <!-- Controls -->
    <a class="left carousel-control" href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
    </a>



</div>
<!-- END HOME SLIDER SECTION -->

<!-- BEGIN HOME ADVANCED SEARCH -->
<div id="home-advanced-search" class="open">
    <div id="opensearch"></div>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <form>
                    <div class="form-group">
                        <div class="form-control-small">
                            <div class=\'input-group date chzn-container\' data-datepicker>
                                <input placeholder="Arrive on..." type=\'text\' class="form-control" data-date-format="DD/MM/YYYY"/>
										<span class="input-group-addon">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
                            </div>
                        </div>

                        <div class="form-control-small">
                            <select id="search_status" name="search_status" data-placeholder="Stay...">
                                <option value=""> </option>
                                <option value="1">1 Night</option>
                                <option value="2">2 Nights</option>
                                <option value="3">3 Nights</option>
                                <option value="4">4 Nights</option>
                                <option value="5">5 Nights</option>
                                <option value="6">6 Nights</option>
                                <option value="7">7 Nights</option>
                                <option value="8">8 Nights</option>
                                <option value="9">9 Nights</option>
                                <option value="10">10 Nights</option>
                                <option value="11">11 Nights</option>
                                <option value="12">12 Nights</option>
                                <option value="13">13 Nights</option>
                                <option value="14">14 Nights</option>
                            </select>
                        </div>

                        <div class="form-control-small">
                            <select id="search_bedrooms" name="search_bedrooms" data-placeholder="Bedrooms">
                                <option value=""> </option>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="5plus">5+</option>
                            </select>
                        </div>
                        <div class="form-control-large">
                            <input type="text" class="form-control" name="location" placeholder="City, State, Country, etc...">
                        </div>
                        <button type="submit" class="btn btn-fullcolor">Search</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
<!-- END HOME ADVANCED SEARCH -->


<!-- BEGIN CONTENT WRAPPER -->
<div class="content">
<div class="container">
<div class="row">

<!-- BEGIN MAIN CONTENT -->
<div class="main col-sm-8">
<h1 class="section-title">Featured Properties</h1>

<div class="grid-style1 clearfix">
    ';

$scope->locally()->obj('FeaturedProperties', null, true); $scope->pushScope(); while (($key = $scope->next()) !== false) {
$val .= '
    <div class="item col-md-4">
        <div class="image">
            <a href="';

$val .= $scope->locally()->XML_val('Link', null, true);
$val .= '">
                <h3>';

$val .= $scope->locally()->XML_val('Title', null, true);
$val .= '</h3>
                <span class="location">';

$val .= $scope->locally()->obj('Region', null, true)->XML_val('Title', null, true);
$val .= '</span>
            </a>
            ';

$val .= $scope->locally()->obj('PrimaryPhoto', null, true)->XML_val('CroppedImage', array('220', '194'), true);
$val .= '
        </div>
        <div class="price">
            <span>';

$val .= $scope->locally()->obj('PricePerNight', null, true)->XML_val('Nice', null, true);
$val .= '</span><p>per night<p>
        </div>
        <ul class="amenities">
            <li><i class="icon-bedrooms"></i> ';

$val .= $scope->locally()->XML_val('Bedrooms', null, true);
$val .= '</li>
            <li><i class="icon-bathrooms"></i> ';

$val .= $scope->locally()->XML_val('Bathrooms', null, true);
$val .= '</li>
        </ul>
    </div>
    ';


}; $scope->popScope(); 
$val .= '
</div>



<div class="row">
    <div class="col-sm-12">
        <h1 class="section-title">Popular Regions</h1>
        <div id="regions">
            <div class="item">
                <a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">
                    <img src="http://placehold.it/194x194" alt=""  />
                    <h3>Rhovanion</h3>
                </a>
            </div>
            <div class="item">
                <a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">
                    <img src="http://placehold.it/194x194" alt="" />
                    <h3>Eriador</h3>
                </a>
            </div>
            <div class="item">
                <a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">
                    <img src="http://placehold.it/194x194" alt=""  />
                    <h3>Bay of Belfalas</h3>
                </a>
            </div>
            <div class="item">
                <a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">
                    <img src="http://placehold.it/194x194" alt="" />
                    <h3>Mordor</h3>
                </a>
            </div>

            <div class="item">
                <a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">
                    <img src="http://placehold.it/194x194" alt=""  />
                    <h3>The Southwest</h3>
                </a>
            </div>
            <div class="item">
                <a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">
                    <img src="http://placehold.it/194x194" alt="" />
                    <h3>Arnor</h3>
                </a>
            </div>
        </div>


    </div>
</div>





<h1 class="section-title">Recent Articles</h1>
<div class="grid-style1">
    ';

$scope->locally()->obj('LatestArticles', null, true); $scope->pushScope(); while (($key = $scope->next()) !== false) {
$val .= '
    <div class="item col-md-4">
        <div class="image">
            <a href="';

$val .= $scope->locally()->XML_val('Link', null, true);
$val .= '">
                <span class="btn btn-default"><i class="fa fa-file-o"></i> Read More</span>
            </a>
            ';

$val .= $scope->locally()->obj('Photo', null, true)->XML_val('CroppedImage', array('220', '148'), true);
$val .= '
        </div>
        <div class="tag"><i class="fa fa-file-text"></i></div>
        <div class="info-blog">
            <ul class="top-info">
                <li><i class="fa fa-calendar"></i> ';

$val .= $scope->locally()->obj('Date', null, true)->XML_val('Format', array('j F, Y'), true);
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

if ($scope->locally()->hasValue('Teaser', null, true)) { 
$val .= $scope->locally()->XML_val('Teaser', null, true);

}else { 
$val .= $scope->locally()->obj('Content', null, true)->XML_val('FirstSentence', null, true);

}
$val .= '</p>
        </div>
    </div>
    ';


}; $scope->popScope(); 
$val .= '

</div>

<div class="center"><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#" class="btn btn-default-color">View All News</a></div>
</div>
<!-- END MAIN CONTENT -->

<!-- BEGIN SIDEBAR -->
<div class="sidebar col-sm-4">
    <!-- BEGIN SIDEBAR ABOUT -->
    <div class="col-sm-12">
        <h2 class="section-title">Last minute deals</h2>
        <ul class="latest-news">
            <li class="col-md-12">
                <div class="image">
                    <a href="blog-detail.html"></a>
                    <img alt="" src="http://placehold.it/100x100">
                </div>

                <ul class="top-info">
                    <li><i class="fa fa-calendar"></i>Available Now</li>
                </ul>

                <h4><a href="blog-detail.html">Private Beach</a><p>Lossarnach, Eriado</p></h4>
            </li>
            <li class="col-md-12">
                <div class="image">
                    <a href="blog-detail.html"></a>
                    <img alt="" src="http://placehold.it/100x100">
                </div>

                <ul class="top-info">
                    <li><i class="fa fa-calendar"></i>Available on 24 July</li>
                </ul>

                <h4><a href="blog-detail.html">Mountain views</a><p>Hyarnustar, Rhovanion</p></h4>
            </li>
            <li class="col-md-12">
                <div class="image">
                    <a href="blog-detail.html"></a>
                    <img alt="" src="http://placehold.it/100x100">
                </div>

                <ul class="top-info">
                    <li><i class="fa fa-calendar"></i>Available 5 July</li>
                </ul>

                <h4><a href="blog-detail.html">Heart of the village</a><p>Minhiriath, Eriador</p></h4>
            </li>
            <li class="col-md-12">
                <div class="image">
                    <a href="blog-detail.html"></a>
                    <img alt="" src="http://placehold.it/100x100">
                </div>

                <ul class="top-info">
                    <li><i class="fa fa-calendar"></i>Available 6 July</li>
                </ul>

                <h4><a href="blog-detail.html">The city life</a><p>West Beleriand, Mordor</p></h4>
            </li></ul>
        <p class="center"><a class="btn btn-fullcolor" href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">More deals</a></p>
    </div>
    <!-- END SIDEBAR ABOUT -->


    <div class="col-sm-12">
        <h2 class="section-title">Activity</h2>
        <ul class="activity">
            <li class="col-lg-12">
                <a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#"><img src="http://placehold.it/70x70" alt="" /></a>
                <div class="info">
                    <h5>Sam Minnée reviewed <a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">The House With No Windows</a></h4>
                        <p>Awesome solitary confinement, mate. Spot on. Sweet as.</p>
                        <h6>Just now</h6>
                </div>
            </li>
            <li class="col-lg-12">
                <a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#"><img src="http://placehold.it/70x70" alt="" /></a>
                <div class="info">
                    <h5>Ingo Schoomer asked a question about <a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">The Mistake by the Lake</a></h4>
                        <p>Has this house been unit tested?</p>
                        <h6>37 minutes ago</h6>
                </div>
            </li>
        </ul>
    </div>



</div>
<!-- END SIDEBAR -->

</div>
</div>
</div>
<!-- END CONTENT WRAPPER -->';

