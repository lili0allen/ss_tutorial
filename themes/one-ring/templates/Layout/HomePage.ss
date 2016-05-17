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
<div class="main col-sm-12">


</div>
<!-- END MAIN CONTENT -->



</div>
</div>
</div>
<!-- END CONTENT WRAPPER -->