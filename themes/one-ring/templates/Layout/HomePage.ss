<% include Banner %>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
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

        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <% with $SearchForm %>
                <form action="/services" method="get">
                    <% with $Fields %>
                        <% with $dataFieldByName('Service') %>
                            <div class="col-md-3">
                                <fieldset class="form-group">
                                    $Me
                                </fieldset>
                            </div>
                        <% end_with %>
                        <% with $dataFieldByName('Postcode') %>
                            <div class="col-md-3">
                                <fieldset class="form-group">
                                    $Me
                                </fieldset>
                            </div>
                        <% end_with %>
                        <% with $dataFieldByName('Distance') %>
                            <div class="col-md-3">
                                <fieldset class="form-group">
                                    搜索半径: $Me
                                </fieldset>
                            </div>
                        <% end_with %>
                    <% end_with %>
                    <% loop $Actions %>
                        <div class="col-md-3">
                            $Me
                        </div>
                    <% end_loop %>
                    $HiddenFields
                    $resetValidations
                </form>
            <% end_with %>

        </div>
    </div>
</div>


