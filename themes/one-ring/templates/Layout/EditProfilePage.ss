<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-offset-4 col-md-4">
            <h1 class="page-header text-center">$Title</h1>
            <% if $Success %>
                <div class="alert alert-success" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <p>You have successfully registered!</p>
                </div>

                <p>Your details are as follows: </p>
                <% with $CurrentMember %>
                    <p>
                        Name: $Name<br />
                        Email: $Email<br />
                    </p>
                <% end_with %>

                <a href="$Link">Edit details</a>

            <% else %>

                <% if $Saved %>
                    <div class="alert alert-success" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <p>Your profile has been saved!</p>
                    </div>
                <% end_if %>
                <% if $CurrentMember %>
                    $EditProfileForm
                    <p>If you are a business owner, you can create/edit your business entry. $EditServiceLink</p>

                <% else %>
                    <div class="alert alert-danger" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <p>You must <a href="registration">registered</a> and logged in to edit your profile</p>
                    </div>
                <% end_if %>

            <% end_if %>
        </div>
    </div>
</div>
