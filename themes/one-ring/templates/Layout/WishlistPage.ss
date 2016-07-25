<% include Banner %>
<div class="container wishlistpage">
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
                                            <img src="$ThemeDir/images/logoholder.jpg" />
                                        <% end_if %>
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading text-capitalize"><strong>$Title</strong></h4>
                                    <p>$Description.ContextSummary(250)</p>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <i class="fa fa-map-marker "></i> {$Suburb}, {$State} {$Postcode}
                                        </div>
                                        <div class="col-md-6 text-right">
                                            <a class="btn btn-default add-to-wishlist" data-id="$ID">Add To Wishlist</a>
                                            <a class="btn btn-default" href="$Link">View Details</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    <% end_loop %>
                <% else %>
                    Your wishlist is empty. <a href="/services">Search</a> for services and add them to ask for quote.
                <% end_if %>
            </ul>
        </div>
    </div>
</div>