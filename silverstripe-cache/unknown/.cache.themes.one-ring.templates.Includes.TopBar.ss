<?php
$val .= '<div id="top-bar">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <ul id="top-buttons">
                    <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#"><i class="fa fa-sign-in"></i> Login</a></li>
                    <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#"><i class="fa fa-pencil-square-o"></i> Register</a></li>
                    <li class="divider"></li>
                    <li>
                        <div class="language-switcher">
                            <span><i class="fa fa-globe"></i> English</span>
                            <ul>
                                <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Deutsch</a></li>
                                <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Espa&ntilde;ol</a></li>
                                <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Fran&ccedil;ais</a></li>
                                <li><a href="' . (Config::inst()->get('SSViewer', 'rewrite_hash_links') ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "") .
				'#">Portugu&ecirc;s</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>';

