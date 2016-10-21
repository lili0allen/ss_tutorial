<!-- Slider -->
<section class="slider-holder">
    <div class="flexslider">
        <ul class="slides">
            <% loop $Slides %>
               <li>$Image</li>
            <% end_loop %>
        </ul>

        <div class="search-box">
            <div class="container">
                <div class="search-box-inner">
                    <h1>Search for Professionals</h1>
                    <% with $SearchForm %>
                    <form action="/services" method="get" role="form">
                        <div class="row">
                            <% with $Fields %>
                            <% with $dataFieldByName('Service') %>
                            <div class="col-md-3 col-md-offset-1">
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
                                    $Me
                                </fieldset>
                            </div>
                            <% end_with %>
                            <% end_with %>
                            <% loop $Actions %>
                            <div class="col-md-1">
                                <button type="submit" class="btn btn-primary btn-block"><i class="fa fa-search"></i></button>
                            </div>
                            <% end_loop %>
                            $HiddenFields
                            $resetValidations
                        </div>
                    </form>
                    <% end_with %>


                </div>
            </div>
        </div>
    </div>
</section>
<!-- Slider / End -->

