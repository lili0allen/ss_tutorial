<% with $ServiceEntry %>
<% include Banner %>
<div class="container">
    <div class="row">

        <div class="col-md-9">
            <% if $Images %>
                <% loop $Images %>
                    <div class="slide">
                        <img src="$getAbsoluteURL()">
                    </div>
                <% end_loop %>
            <% end_if %>
            $Content
            <div id="map_canvas"></div>
        </div>
        <div class="col-md-3">
            <a class="btn btn-default add-to-wishlist" data-id="$ID">Add To Wishlist</a>

        </div>


    </div>
</div>
<% end_with %>l