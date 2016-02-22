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
        'get_feed'
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
        Requirements::javascript("http://reece.trout.com.au/thermann/thermann.com.au/js/socialfeed.min.js");
	}

    public function get_facebook_feed($results = array()){

        define('FACEBOOK_APP_ID', '573892112706802');
        define('FACEBOOK_APP_SECRET','2bc5663fa9c0f4dc6d0bf6ee23a41844');
        define('FACEBOOK_TOKEN','CAAIJ86uEbPIBAE4ZBEFJe2bZCqLlZCAE3KlBpefZCadBmpFnKyjIIcjJxEeqX0ilToo3RXEDoOBXaPJOLqoKQ1VWO3dR6chYleU9WHKTgkckV5gVG6YMGTtaSWGMgtZCbJZAmHLUaP5s7PTCJiDsuRBXTqowFzp6fXQKL3lnPxCNPeGRhL3dAGE4j9TYuZAOR3qxgtJC39VCwZDZD');
        $fb = new Facebook(array(
            'appId' => FACEBOOK_APP_ID,
            'secret' => FACEBOOK_APP_SECRET,
            ));

        try {
            $response = $fb->api(
                '/me/feed?limit=6&fields=full_picture,message,message_tags,link,status_type,type,created_time',
                array('method'=>'GET',
                    'access_token'=>FACEBOOK_TOKEN)

            );// var_dump($response);
        } catch(FacebookApiException $e) {
            //echo 'Graph returned an error: ' . $e->getMessage();
            return false;
            exit;
        }


        $data = json_decode(json_encode($response));
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

    // Function to authenticate app with Twitter.
    function getConnectionWithAccessToken($cons_key, $cons_secret, $oauth_token, $oauth_token_secret) {
        $connection = new \Abraham\TwitterOAuth\TwitterOAuth($cons_key, $cons_secret, $oauth_token, $oauth_token_secret);
        return $connection;
    }

    // Function to display the latest tweets.
    function display_latest_tweets(

        // Function parameters.
        $results = array(),
        $twitter_user_id,
        $cache_file          = '../tweets.txt',  // Change this to the path of your cache file. (Default : ./tweets.txt)
        $tweets_to_display   = 5,               // Number of tweets you would like to display. (Default : 5)
        $ignore_replies      = false,           // Ignore replies from the timeline. (Default : false)
        $include_rts         = false,           // Include retweets. (Default : false)
        $twitter_wrap_open   = '<ul class="home-tweets-ul">',
        $twitter_wrap_close  = '</ul>',
        $tweet_wrap_open     = '<li><p class="home-tweet-tweet">',
        $meta_wrap_open      = '<br/><span class="home-tweet-date">',
        $meta_wrap_close     = '</span>',
        $tweet_wrap_close    = '</p></li>',
        $date_format         = 'g:i A M jS',    // Date formatting. (http://php.net/manual/en/function.date.php)
        $twitter_style_dates = true){           // Twitter style days. [about an hour ago] (Default : true)

        define('TWITTER_CONSUMER_KEY','UGXijS8viaZUlOttIDD2S8HYS');
        define('TWITTER_CONSUMER_SECRET','LJylRbqPXep1RYKPX5oB9GLxocVfHLG1QZB6rKRT9yHg38xOB2');
        define('TWITTER_ACCESS_TOKEN','46998444-0C51rj4HPJQIygVaitL19nBIqYXYwd2WbMujh8QRw');
        define('TWITTER_ACCESS_TOKEN_SECRET','PR2Xil5T94tDOfHmQb0MbosvAXK5yBYKbDQ1LoISpNKjS');

        // Twitter keys (You'll need to visit https://dev.twitter.com and register to get these.
        $consumerkey         = TWITTER_CONSUMER_KEY;
        $consumersecret      = TWITTER_CONSUMER_SECRET;
        $accesstoken         = TWITTER_ACCESS_TOKEN;
        $accesstokensecret   = TWITTER_ACCESS_TOKEN_SECRET;


        // Cache file not found, or old. Authenticae app.
        $connection = $this->getConnectionWithAccessToken($consumerkey, $consumersecret, $accesstoken, $accesstokensecret);

        if($connection){
            // Get the latest tweets from Twitter
            //get_tweets = $connection->get("https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=".$twitter_user_id."&count=".$tweets_to_display."&include_rts=".$include_rts."&exclude_replies=".$ignore_replies);
            $get_tweets = $connection->get("statuses/user_timeline",array("screen_name"=>$twitter_user_id,
                "count"=>$tweets_to_display,"include_rts"=>$include_rts,"exclude_replies"=>$ignore_replies));

            // Error check: Make sure there is at least one item.
            if (count($get_tweets)) {

                //echo $json;
                $data = $get_tweets;
                foreach($data as $key => $post):
                    $date = strtotime($post->created_at);
                    $hashtags = array();
                    $mentions = array();
                    $text = $post->text;
                    if(isset($post->entities->hashtags)){
                        foreach($post->entities->hashtags as $hashtag){
                            $hashtags[] = $hashtag->text;
                            $text = str_replace('#'.$hashtag->text, "<span class=\"hashtag\">#".$hashtag->text."</span>", $text);
                        }
                    }
                    if(isset($post->entities->user_mentions)){
                        foreach($post->entities->user_mentions as $user){
                            $mentions[] = $user->screen_name;
                            $text = str_replace('@'.$user->screen_name, "<span class=\"mention\">@".$user->screen_name."</span>", $text);
                        }
                    }


                    $results[$date][] = array(
                        'type' => "Twitter",
                        'title' => $text,
                        'tags' => $hashtags,
                        'mentions' => $mentions,
                        'picture' => str_replace("normal.","400x400.",$post->user->profile_image_url),
                        'link' => 'http://twitter.com/'.$post->user->screen_name
                    );
                endforeach;
                return $results;
            }

        }

    }

    public function get_feed(){
        // Seconds to cache feed (Default : 3 minutes).
        $cache_file='../tweets.txt';
        $cachetime           = 60*3;
        // Time that the cache was last updtaed.
        $cache_file_created  = ((file_exists($cache_file))) ? filemtime($cache_file) : 0;
        //$cache_file_created  = false;

        // A flag so we know if the feed was successfully parsed.
        $tweet_found         = false;

        // Show cached version of tweets, if it's less than $cachetime.
        if (time() - $cachetime < $cache_file_created) {
            $tweet_found = true;
            // Display tweets from the cache.
            $file = file_get_contents($cache_file);
            echo $file;
        }else{
            $results = array();
            $results = $this->get_facebook_feed();
            $results = $this->display_latest_tweets($results, 'thermann_hwu');
            krsort($results);
            $final_results = array();
            foreach($results as $result){
                foreach($result as $data){
                    $final_results[] = $data;
                }
            }
            $results = json_encode($final_results);
            // Generate a new cache file.
            $file = fopen($cache_file, 'w');
            // Save the contents of output buffer to the file, and flush the buffer.
            fwrite($file, $results);
            fclose($file);
            echo $results;
        }
    }


}
