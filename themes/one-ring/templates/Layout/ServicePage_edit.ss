<% include Banner %>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <% if $CurrentMember %>
                <% if $Saved %>
                    <div class="alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <p>Your service entry has been saved! <a href="{$Link}" target="_blank">View</a></p>
                    </div>
                <% end_if %>
                $ServiceForm
            <% else %>
                <div class="alert alert-danger" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <p>You must <a href="registration">registered</a> and logged in to edit your profile</p>
                </div>
            <% end_if %>
        </div>
    </div>
</div>
