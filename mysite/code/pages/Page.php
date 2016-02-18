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
	private static $allowed_actions = array (
        'getsocialfeeds'
	);

	public function init() {
		parent::init();
		// You can include any CSS or JS required by your project here.
		// See: http://doc.silverstripe.org/framework/en/reference/requirements

        Requirements::css("http://fonts.googleapis.com/css?family=Raleway:300,500,900%7COpen+Sans:400,700,400italic");
        Requirements::css($this->ThemeDir()."/css/bootstrap.min.css");
        Requirements::css($this->ThemeDir()."/css/style.css");
        Requirements::javascript($this->ThemeDir()."/javascript/common/modernizr.js");
        Requirements::javascript($this->ThemeDir()."/javascript/common/jquery-1.11.1.min.js");
        Requirements::javascript($this->ThemeDir()."/javascript/common/bootstrap.min.js");
        Requirements::javascript($this->ThemeDir()."/javascript/common/bootstrap-datepicker.js");
        Requirements::javascript($this->ThemeDir()."/javascript/common/chosen.min.js");
        Requirements::javascript($this->ThemeDir()."/javascript/common/bootstrap-checkbox.js");
        Requirements::javascript($this->ThemeDir()."/javascript/common/nice-scroll.js");
        Requirements::javascript($this->ThemeDir()."/javascript/common/jquery-browser.js");
        Requirements::javascript($this->ThemeDir()."/javascript/scripts.js");
	}

    public function getsocialfeeds(){

        define('FACEBOOK_APP_ID', '573892112706802');
        define('FACEBOOK_APP_SECRET','2bc5663fa9c0f4dc6d0bf6ee23a41844');
        define('FACEBOOK_TOKEN','CAAIJ86uEbPIBAEPqD4gwzj0zoLVCkDkBUh9cgoY5jrXBjpIE9t0Ypyto1Sr7bYUbp31N2yZAhqGssj7T6dJlDNuABn0DGZCEk0AizqJVtcWBe6Tkj4XAfkLZAuUObRpHtIHsEagbBNJOVFdZC0J2hMY1HzWk3b95he1OZA4eCcbkul6oEoU7hFzNF8vsChKZAHtHRVGCiZBKuZCGuiEeXST4');
        $fb = new Facebook(array(
            'appId' => '573892112706802',
            'secret' => '2bc5663fa9c0f4dc6d0bf6ee23a41844',
            ));
        $fb->setAccessToken('CAAIJ86uEbPIBAE4ZBEFJe2bZCqLlZCAE3KlBpefZCadBmpFnKyjIIcjJxEeqX0ilToo3RXEDoOBXaPJOLqoKQ1VWO3dR6chYleU9WHKTgkckV5gVG6YMGTtaSWGMgtZCbJZAmHLUaP5s7PTCJiDsuRBXTqowFzp6fXQKL3lnPxCNPeGRhL3dAGE4j9TYuZAOR3qxgtJC39VCwZDZD');

        try {
            // Returns a `Facebook\FacebookResponse` object
            $response = $fb->api('/me'); return $response;
        } catch(FacebookApiException $e) {
            //echo 'Graph returned an error: ' . $e->getMessage();
            return false;
            exit;
        }


        $data = json_decode($response->getBody());
        $n=0;
        foreach($data->data as $key => $post):
            if(isset($post->created_time) && isset($post->full_picture)){
                $date = strtotime($post->created_time);
                $message_tags = array();
                if(isset($post->message_tags)){
                    foreach($post->message_tags as $data){
                        $message_tags[] = $data->name;
                    }
                }
                $results[$date][] = array(
                    'type' => "Facebook",
                    'title' => isset($post->message) ? $post->message : "",
                    'tags' => $message_tags,
                    'mentions' => '',
                    'picture' => isset($post->full_picture) ? $post->full_picture : "",
                    'link' => isset($post->link) ? $post->link : ""
                );
                $n++;
            }
        endforeach;
        return $results;
    }

}
