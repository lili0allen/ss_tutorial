<% if $Success %>

    <p class="savedMessage">You have successfully registered!</p>

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

        <p class="savedMessage">Your profile has been saved!</p>

    <% end_if %>
    <% if $CurrentMember %>
        $EditProfileForm

        $EditServiceForm
    <% else %>
        You must <a href="registration">registered</a> and logged in to edit your profile
    <% end_if %>

<% end_if %>