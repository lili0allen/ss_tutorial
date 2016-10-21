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
                        $this->ThemeDir()."/css/font-awesome.min.css",
						$this->ThemeDir()."/css/flexslider.css",
						$this->ThemeDir()."/css/animate.min.css",
						$this->ThemeDir()."/css/theme.css",
						$this->ThemeDir()."/css/theme-elements.css",
						$this->ThemeDir()."/css/style.css",
                    )
        );
        Requirements::combine_files('site_script.js',
                    array(
                        $this->ThemeDir()."/javascript/modernizr.js",
                        $this->ThemeDir()."/javascript/jquery.min.js",
                        $this->ThemeDir()."/javascript/bootstrap.min.js",
                        $this->ThemeDir()."/javascript/bootstrap3-typeahead.min.js",
                        $this->ThemeDir()."/javascript/jquery.validate.min.js",
						$this->ThemeDir()."/javascript/jquery.geocomplete.min.js",
						$this->ThemeDir()."/javascript/jquery.flexslider-min.js",
						$this->ThemeDir()."/javascript/jquery.appear.js",
						$this->ThemeDir()."/javascript/jquery.flexnav.min.js",
						$this->ThemeDir()."/javascript/script.js",
					)
        );
	}

	public function EditServiceLink(){
		$servicePage = DataObject::get_one('ServicePage');
		if(Member::currentUser()->ServiceEntryID){
			$serviceLink = array(
				'link'  =>  $servicePage->Link().'edit',
				'text'  =>  'Edit Service'
			);
		}else{
			$serviceLink = array(
				'link'  =>  $servicePage->Link().'edit',
				'text'  =>  'Create Service'
			);
		}
		return '<a href="'.$serviceLink['link'].'">'.$serviceLink['text'].'</a>';
	}

}
