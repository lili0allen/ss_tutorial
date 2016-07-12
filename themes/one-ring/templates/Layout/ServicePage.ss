<% include Banner %>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            $SearchForm
            <% if $ServiceEntries %>
                <% loop $ServiceEntries %>
                    $Title
                <% end_loop %>
            <% end_if %>
        </div>
    </div>
</div>