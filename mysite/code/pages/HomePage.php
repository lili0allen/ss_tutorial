<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 12/7/15
 * Time: 8:32 AM
 */

class HomePage extends Page {

}

class HomePage_Controller extends Page_Controller {

    public function LatestArticles($count =3) {
        return ArticlePage::get()
                    ->sort('Created', 'DESC')
                    ->limit($count);
    }

    public function FeaturedProperties(){
        return Property::get()
                    ->filter(array(
                        'FeaturedOnHomepage' => true
                        ))
                    ->limit(6);
    }

}