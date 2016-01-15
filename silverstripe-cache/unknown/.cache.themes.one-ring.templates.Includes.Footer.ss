<?php
$val .= '<footer id="footer">
    <div id="footer-top" class="container">
        <div class="row">
            <div class="block col-sm-3">
                <a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#"><img src="';

$val .= $scope->locally()->XML_val('ThemeDir', null, true);
$val .= '/images/logo.png" alt="One Ring Rentals" /></a>
                <br><br>
                ';

$scope->locally()->obj('SiteConfig', null, true); $scope->pushScope();
$val .= '
                    ';

$val .= $scope->locally()->XML_val('FooterContent', null, true);
$val .= '
                ';


; $scope->popScope(); 
$val .= '
            </div>
            <div class="block col-sm-3">
                <h3>Helpful Links</h3>
                <ul class="footer-links">
                    <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">All rentals</a></li>
                    <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">List your rental</a></li>
                    <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Read our FAQs</a></li>
                </ul>
            </div>
            <div class="block col-sm-6">
                <h3>Popular regions</h3>
                <div class="row">
                    <div class="col-sm-6">
                        <ul class="footer-listings">
                            <li>
                                <div class="image">
                                    <a href="properties-detail.html"><img src="http://placehold.it/760x670" alt="" /></a>
                                </div>
                                <p><a href="properties-detail.html">Rhovanion</a></p>
                            </li>
                            <li>
                                <div class="image">
                                    <a href="properties-detail.html"><img src="http://placehold.it/760x670" alt="" /></a>
                                </div>
                                <p><a href="properties-detail.html">Eriador</a></p>
                            </li>
                            <li>
                                <div class="image">
                                    <a href="properties-detail.html"><img src="http://placehold.it/760x670" alt="" /></a>
                                </div>
                                <p><a href="properties-detail.html">Bay of Belfalas</a></p>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-6">
                        <ul class="footer-listings">
                            <li>
                                <div class="image">
                                    <a href="properties-detail.html"><img src="http://placehold.it/760x670" alt="" /></a>
                                </div>
                                <p><a href="properties-detail.html">Mordor</a></p>
                            </li>
                            <li>
                                <div class="image">
                                    <a href="properties-detail.html"><img src="http://placehold.it/760x670" alt="" /></a>
                                </div>
                                <p><a href="properties-detail.html">Arnor</a></p>
                            </li>
                            <li>
                                <div class="image">
                                    <a href="properties-detail.html"><img src="http://placehold.it/760x670" alt="" /></a>
                                </div>
                                <p><a href="properties-detail.html">Forlindon</a></p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- BEGIN COPYRIGHT -->
    <div id="copyright">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    &copy; 2014 One Ring Rentals

                    <!-- BEGIN SOCIAL NETWORKS -->
                    <ul class="social-networks">
                        ';

$scope->locally()->obj('SiteConfig', null, true); $scope->pushScope();
$val .= '
                            ';

if ($scope->locally()->hasValue('FacebookLink', null, true)) { 
$val .= '
                                <li><a href="';

$val .= $scope->locally()->XML_val('FacebookLink', null, true);
$val .= '"><i class="fa fa-facebook"></i></a></li>
                            ';


}
$val .= '
                            ';

if ($scope->locally()->hasValue('TwitterLink', null, true)) { 
$val .= '
                                <li><a href="';

$val .= $scope->locally()->XML_val('TwitterLink', null, true);
$val .= '"><i class="fa fa-twitter"></i></a></li>
                            ';


}
$val .= '
                            ';

if ($scope->locally()->hasValue('GoogleLink', null, true)) { 
$val .= '
                                <li><a href="';

$val .= $scope->locally()->XML_val('GoogleLink', null, true);
$val .= '"><i class="fa fa-google"></i></a></li>
                            ';


}
$val .= '
                            ';

if ($scope->locally()->hasValue('YouTubeLink', null, true)) { 
$val .= '
                                <li><a href="';

$val .= $scope->locally()->XML_val('YouTubeLink', null, true);
$val .= '"><i class="fa fa-youtube"></i></a></li>
                            ';


}
$val .= '
                        ';


; $scope->popScope(); 
$val .= '
                    </ul>
                    <!-- END SOCIAL NETWORKS -->

                </div>
            </div>
        </div>
    </div>
    <!-- END COPYRIGHT -->

</footer>';

