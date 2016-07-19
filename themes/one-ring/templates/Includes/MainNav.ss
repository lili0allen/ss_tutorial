<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">

            <!-- Collapsed Hamburger -->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                <span class="sr-only">Toggle Navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <!-- Branding Image -->
            <a class="navbar-brand" href="/">
                Logo
            </a>
        </div>

        <div class="collapse navbar-collapse" id="app-navbar-collapse">
            <!-- Left Side Of Navbar -->
            <ul class="nav navbar-nav">
                <% loop $Menu(1) %>
                    <li><a class="$LinkingMode" href="$Link" title="Go to the $Title page">$MenuTitle</a></li>
                <% end_loop %>
            </ul>

            <!-- Right Side Of Navbar -->
            <ul class="nav navbar-nav navbar-right">
                <% if $CurrentMember %>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                            <i class="fa fa-user" aria-hidden="true"></i>&nbsp; $CurrentMember.Name <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu">
                            <li><a href="$Page('edit-profile').Link">Edit Profile</a></li>
                            <li>$EditServiceLink</li>
                            <li><a href="/Security/logout">Logout</a></li>
                        </ul>
                    </li>
                <% else %>
                    <li><a href="/Security/login">Login</a></li>
                    <li><a href="$Page('registration').Link">Register</a></li>

                <% end_if %>
                <li><a><i class="fa fa-heart-o"></i> Wishlist (<span id="wishlist-count">0</span>)</a></li>
            </ul>
        </div>
    </div>
</nav>
