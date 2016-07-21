<% include Banner %>
<div class="container servicepage">
    <div class="row margin-row">
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
    <div class="row margin-row">
        <div class="col-sm-12">
            <ul class="list-group">
            <% if $ServiceEntries %>
                <% loop $ServiceEntries %>
                    <li class="list-group-item">
                        <div class="media">
                            <div class="media-left">
                                <a href="$Link()">
                                    <% if $Logo %>
                                        $Logo.CroppedImage(100,100)
                                    <% else %>
                                        <img src="http://placehold.it/100x100">
                                    <% end_if %>
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading text-capitalize"><strong>$Title</strong></h4>
                                <p>$Description.ContextSummary(250)</p>
                                <div class="row">
                                    <div class="col-md-12 text-right">
                                        <a class="btn btn-default add-to-wishlist" data-id="$ID">Add To Wishlist</a>
                                        <a class="btn btn-default">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                <% end_loop %>
            <% end_if %>
            </ul>
        </div>
    </div>
</div>