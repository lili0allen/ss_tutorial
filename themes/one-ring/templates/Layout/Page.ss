
<!-- BEGIN PAGE TITLE/BREADCRUMB -->
<% include Banner %>
<!-- END PAGE TITLE/BREADCRUMB -->


<!-- BEGIN CONTENT -->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="main col-sm-8">
                $Content
                $Form
                <section id="hotTopics" class="pageSummary">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <h2 class="sectionHd">Hot topics</h2>
                                <div class="loading">
                                    <i class="fa fa-spin fa-refresh"></i>
                                </div>
                                <div class="social-feed">
                                </div>
                                <div class="social-links">
                                    <ul class="list-inline">
                                        <li class="title"><b>Follow Thermann:</b></li>
                                        <li><a href="https://www.facebook.com/Thermann-351677488327997/" class="facebook"><i class="fa fa-facebook"></i> Facebook</a></li>
                                        <li><a href="https://twitter.com/thermann_hwu" class="twitter"><i class="fa fa-twitter"></i> Twitter</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </section>
            </div>

            <div class="sidebar gray col-sm-4">
                $BlockArea(Sidebar)
                <% if $Menu(2) %>
                    <h2 class="section-title">In this section</h2>
                    <ul class="categories subnav">
                        <% loop $Menu(2) %>
                            <li><a class="$LinkingMode" href="$Link">$MenuTitle</a></li>
                        <% end_loop %>
                    </ul>
                <% end_if %>
            </div>
        </div>
    </div>
</div>
<!-- END CONTENT -->




