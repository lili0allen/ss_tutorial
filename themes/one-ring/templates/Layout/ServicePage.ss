<% include Banner %>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <% with $SearchForm %>
                <form $AttributesHTML>
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
                                Distance: $Me
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
    <div class="row">
        <div class="col-sm-12">
            <% if $ServiceEntries %>
                <% loop $ServiceEntries %>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">$Title</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="media">
                                        <div class="media-left">
                                            <a href="$Link()">
                                                $Logo.CroppedImage(100,100)
                                            </a>
                                        </div>
                                        <div class="media-body">
                                            <p>$Description</p>
                                        </div>
                                        <div class="media-footer">Panel footer</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <% end_loop %>
            <% end_if %>
        </div>
    </div>
</div>