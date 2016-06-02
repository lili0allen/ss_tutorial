<?php
class Page extends SiteTree {

	private static $db = array(
	);

	private static $has_one = array(
	);

}
class Page_Controller extends ContentController {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */

	public function init() {
		parent::init();
		// You can include any CSS or JS required by your project here.
		// See: http://doc.silverstripe.org/framework/en/reference/requirements

        //Requirements::css("http://fonts.googleapis.com/css?family=Raleway:300,500,900%7COpen+Sans:400,700,400italic");

        Requirements::set_combined_files_folder('themes/one-ring/combined');
        Requirements::combine_files('site_style.css',
                    array(
                        $this->ThemeDir()."/css/bootstrap.min.css",
                        $this->ThemeDir()."/css/bootstrap-datepicker.min.css",
                        $this->ThemeDir()."/css/font-awesome.min.css",
                        $this->ThemeDir()."/css/style.css"
                    )
        );
        Requirements::combine_files('site_script.js',
                    array(
                        $this->ThemeDir()."/javascript/modernizr.js",
                        $this->ThemeDir()."/javascript/jquery.min.js",
                        $this->ThemeDir()."/javascript/bootstrap.min.js",
                        $this->ThemeDir()."/javascript/bootstrap3-typeahead.min.js",
                        //$this->ThemeDir()."/javascript/bootstrap-datepicker.min.js",
                        $this->ThemeDir()."/javascript/jquery.form.js",
                        $this->ThemeDir()."/javascript/jquery.validate.min.js",
                        $this->ThemeDir()."/javascript/script.js",
                    )
        );
	}

}
