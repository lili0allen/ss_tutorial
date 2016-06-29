<div id="main">
    <div class="container">
        <% if $CurrentMember %>
            <% if $Success %>
                <p class="savedMessage">You have successfully registered! <a href="{$Link}" target="_blank">View</a></p>
            <% end_if %>
            <% if $Saved %>
                <p class="savedMessage">Your profile has been saved! <a href="{$Link}" target="_blank">View</a></p>
            <% end_if %>
            <div class="row">
                <div class="col-md-12">
                    $ServiceForm
                </div>
            </div>
        <% else %>
            You must <a href="registration">registered</a> and logged in to edit your profile
        <% end_if %>
    </div>
</div>
