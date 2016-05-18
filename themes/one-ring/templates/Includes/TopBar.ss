<div id="top-bar">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <ul id="top-buttons">
                    <% if $CurrentUser %>
                        <li>Hello $CurrentUser.Name</li>
                        <li><a href="$Page('edit-profile').Link"><i class="fa fa-pencil-square-o"></i> Edit Profile</a></li>
                        <li><a href="/Security/logout"><i class="fa fa-sign-out"></i> Logout</a></li>
                    <% else %>
                        <li><a href="/Security/login"><i class="fa fa-sign-in"></i> Login</a></li>
                        <li><a href="$Page('registration').Link"><i class="fa fa-pencil-square-o"></i> Register</a></li>
                    <% end_if %>
                </ul>
            </div>
        </div>
    </div>
</div>