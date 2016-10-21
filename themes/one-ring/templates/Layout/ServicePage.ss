<% include Banner %>
<div class="container servicepage">
    <div class="row margin-row">
        <div class="col-sm-12">

                <div class="container">
                    <div class="search-box-inner">
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
    <div class="results">
        <% include SearchResults %>
    </div>

</div>