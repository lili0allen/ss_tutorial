<div class="row margin-row">
    <div class="col-sm-12">
        <% if $ServiceEntries %>
            <ul class="list-group">
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
            </ul>
        <% end_if %>
    </div>
</div>
<div class="row">
    <div class="col-xs-12 text-center">
        <% if $ServiceEntries.MoreThanOnePage %>
            <nav>
                <ul class="pagination">
                    <% if $ServiceEntries.NotFirstPage %>
                        <li>
                            <a href="$ServiceEntries.PrevLink" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    <% end_if %>
                    <% loop $ServiceEntries.Pages %>
                        <li <% if $CurrentBool %>class="active"<% end_if %>><a href="$Link">$PageNum</a></li>
                    <% end_loop %>
                    <% if $ServiceEntries.NotLastPage %>
                        <li>
                            <a href="$ServiceEntries.NextLink" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    <% end_if %>
                </ul>
            </nav>
        <% end_if %>
    </div>
</div>