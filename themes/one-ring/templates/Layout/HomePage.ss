<!-- BEGIN HOME SLIDER SECTION -->
<% if $Slides %>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    </ol> -->

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <% loop $Slides %>
        <div class="item <% if $First %>active<% end_if %>" id="slide{$Pos}" style="background: url('{$Image.AbsoluteURL}') no-repeat left center; background-size: cover;"> <!-- Ready for JS Injection -->
            <div class="carousel-caption">
                <div class="caption sfr slider-title">$Title</div>
                <div class="caption sfl slider-subtitle">$SubTitle</div>
                <a href="#" class="caption sfb btn btn-default btn-lg">$ButtonContent</a>
            </div>
        </div>
        <% end_loop %>
    </div>
    <!-- Blue Filter -->
    <div id="home-search-section"></div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
    </a>

</div>
<% end_if %>
<!-- END HOME SLIDER SECTION -->

<!-- BEGIN HOME ADVANCED SEARCH -->
<div id="home-advanced-search" class="open">
    <div id="opensearch"></div>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                    <div class="form-group">
                        <% with $PropertySearchForm %>
                            <form action="/find-a-rental" method="get" >
                            <% with $Fields %>
                                <div class="form-control-small">
                                    $FieldByName('ArrivalDate').setAttribute('placeholder', 'Arrive on...')
                                </div>
                                <div class="form-control-small">
                                    $FieldByName('Nights').setEmptyString('Stay...')
                                </div>
                                <div class="form-control-small">
                                    $FieldByName('Bedrooms').setEmptyString('Bathrooms')
                                </div>
                                <div class="form-control-small">
                                    $FieldByName('Keywords')
                                </div>
                            <% end_with %>
                            <% if $Actions %>
                                <% loop $Actions %>
                                <div class="form-control-small">
                                $Field
                                </div>
                                <% end_loop %>
                            <% end_if %>
                            </form>
                        <% end_with %>
                    </div>
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
    <% if $FeaturedProperties %>
        <h1 class="section-title">Featured Properties</h1>
        <div class="grid-style1 clearfix">
            <% loop $FeaturedProperties %>
            <div class="item col-md-4">
                <div class="image">
                    <a href="$Link">
                        <h3>$Title</h3>
                        <span class="location">$Region.Title</span>
                    </a>
                    $PrimaryPhoto.CroppedImage(220,194)
                </div>
                <div class="price">
                    <span>$PricePerNight.Nice</span><p>per night<p>
                </div>
                <ul class="amenities">
                    <li><i class="icon-bedrooms"></i> $Bedrooms</li>
                    <li><i class="icon-bathrooms"></i> $Bathrooms</li>
                </ul>
            </div>
            <% end_loop %>
        </div>
    <% end_if %>

    <% if $PopularRegions %>
        <div class="row">
            <div class="col-sm-12">
                <h1 class="section-title">Popular Regions</h1>
                <div id="regions">
                    <% loop $PopularRegions %>
                    <div class="item">
                        <a href="$Link">
                            $Photo.CroppedImage(194,194)
                            <h3>$Title</h3>
                        </a>
                    </div>
                    <% end_loop %>
                </div>
            </div>
        </div>
    <% end_if %>

    <% if $LatestArticles %>
        <h1 class="section-title">Recent Articles</h1>
        <div class="grid-style1">
            <% loop $LatestArticles %>
            <div class="item col-md-4">
                <div class="image">
                    <a href="$Link">
                        <span class="btn btn-default"><i class="fa fa-file-o"></i> Read More</span>
                    </a>
                    $Photo.CroppedImage(220,148)
                </div>
                <div class="tag"><i class="fa fa-file-text"></i></div>
                <div class="info-blog">
                    <ul class="top-info">
                        <li><i class="fa fa-calendar"></i> $Date.Format('j F, Y')</li>
                        <li><i class="fa fa-comments-o"></i> 2</li>
                        <li><i class="fa fa-tags"></i> $CategoriesList</li>
                    </ul>
                    <h3>
                        <a href="$Link">$Title</a>
                    </h3>
                    <p><% if $Teaser%>$Teaser<% else %>$Content.FirstSentence<% end_if %></p>
                </div>
            </div>
            <% end_loop %>
        </div>
        <div class="center"><a href="#" class="btn btn-default-color">View All News</a></div>
    <% end_if %>

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
        <p class="center"><a class="btn btn-fullcolor" href="#">More deals</a></p>
    </div>
    <!-- END SIDEBAR ABOUT -->


    <div class="col-sm-12">
        <h2 class="section-title">Activity</h2>
        <ul class="activity">
            <li class="col-lg-12">
                <a href="#"><img src="http://placehold.it/70x70" alt="" /></a>
                <div class="info">
                    <h5>Sam Minnée reviewed <a href="#">The House With No Windows</a></h4>
                        <p>Awesome solitary confinement, mate. Spot on. Sweet as.</p>
                        <h6>Just now</h6>
                </div>
            </li>
            <li class="col-lg-12">
                <a href="#"><img src="http://placehold.it/70x70" alt="" /></a>
                <div class="info">
                    <h5>Ingo Schoomer asked a question about <a href="#">The Mistake by the Lake</a></h4>
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
<!-- END CONTENT WRAPPER -->