<!-- Header -->
<header class="header header-menu-fullw">

    <!-- Header Top Bar -->
    <div class="header-top">
        <div class="container">
            <div class="header-top-left">
                <button class="btn btn-sm btn-default menu-link menu-link__secondary">
                    <i class="fa fa-bars"></i>
                </button>
                <div class="menu-container">
                    <% if $SiteConfig.HeaderContent %>
                        <p>
                        $SiteConfig.HeaderContent.RAW
                        </p>
                    <% end_if %>
                </div>
            </div>
            <div class="header-top-right">
                <button class="btn btn-sm btn-default menu-link menu-link__tertiary">
                    <i class="fa fa-user"></i>
                </button>
                <div class="menu-container">
                    <ul class="header-top-nav header-top-nav__tertiary">
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
                        <li><a href="/Security/login"><i class="fa fa-sign-in"></i>Login</a></li>
                        <li><a href="$Page('registration').Link"><i class="fa fa-user-plus"></i> Register</a></li>
                        <% end_if %>
                        <li><a href="/wishlist"><i class="fa fa-heart-o"></i> Wishlist (<span id="wishlist-count">0</span>)</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Header Top Bar / End -->
    <div class="header-main">
        <div class="container">
            <!-- Logo -->
            <div class="logo">
                <a href="/">$SiteConfig.Logo</a>
            </div>
            <!-- Logo / End -->

            <button type="button" class="navbar-toggle">
                <i class="fa fa-bars"></i>
            </button>

            <!-- Navigation -->
            <nav class="nav-main">
                <div class="nav-main-inner">
                    <ul data-breakpoint="992" class="flexnav">
                        <% loop $Menu(1) %>
                        <li><a class="$LinkingMode" href="$Link" title="Go to the $Title page">$MenuTitle</a></li>
                        <% end_loop %>
                    </ul>
                </div>
            </nav>
            <!-- Navigation / End -->

        </div>
    </div>

</header>
<!-- Header / End -->