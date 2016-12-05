<% include Banner %>
<div class="page-content servicepage">
    <div class="container">
        <div class="row">
            <div id="main" class="content col-md-12">
                <div class="search-box-inner">
                    <% with $SearchForm %>
                    <form action="/services" method="get" role="form">
                        <div class="row">
                            <% with $Fields %>
                            <% with $dataFieldByName('Service') %>
                            <div class="col-md-3 col-md-offset-2">
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
                            <!--                                        <% with $dataFieldByName('Distance') %>-->
                            <!--                                            <div class="col-md-3">-->
                            <!--                                                <fieldset class="form-group">-->
                            <!--                                                    $Me-->
                            <!--                                                </fieldset>-->
                            <!--                                            </div>-->
                            <!--                                        <% end_with %>-->
                            <% end_with %>
                            <% loop $Actions %>
                            <div class="col-md-2">
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
        <div class="row">
            <div class="col-md-12">
                <div class="results">
                    <% include SearchResults %>
                </div>
            </div>
        </div>
    </div>
</div>

