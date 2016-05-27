<div id="main">
    <div class="container">
        <% if $Success %>
            <p class="savedMessage">You have successfully registered!</p>
        <% else %>
            <% if $Saved %>
                <p class="savedMessage">Your profile has been saved!</p>
            <% end_if %>
            <% if $CurrentMember %>
                <div class="row">
                    <div class="col-md-12">
                        $ServiceForm
                    </div>
                </div>
            <% else %>
                You must <a href="registration">registered</a> and logged in to edit your profile
            <% end_if %>
        <% end_if %>
    </div>
</div>
