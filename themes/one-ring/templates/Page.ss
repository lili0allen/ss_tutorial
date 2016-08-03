<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="no-js ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="no-js ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="no-js ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->
    <head>

        $MetaTags(false)
        <title>Handy Service | $Title</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

        <% base_tag %>

        <!-- IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>
    <body>
        <% include MainNav %>
        <div id="wrapper">
            $Layout
        </div>
        <% include Footer %>
    </body>
</html>