<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 12/7/15
 * Time: 10:19 AM
 */

class ArticleHolder extends Page {
    private static $allowed_children = array ('ArticlePage');

    private static $has_many = array (
        'Categories' => 'ArticleCategory'
    );

    public function getCMSFields(){
        $fields = parent::getCMSFields();
        $fields->addFieldsToTab('Root.Categories', GridField::create(
            'Categories',
            'Article categories',
            $this->Categories(),
            GridFieldConfig_RecordEditor::create()
        ));
        return $fields;
    }

    public function Regions(){
        $page = RegionsPage::get()->first();
        if($page){
            return $page->Regions();
        }
    }

    public function ArchiveDates(){
        $list = ArrayList::create();
        $stage = Versioned::current_stage();

        $query = new SQLQuery(array());
        $query->selectField("DATE_FORMAT(`Date`,'%Y_%M_%m')","DateString")
            ->setFrom("ArticlePage_{$stage}")
            ->setOrderBy("Date", "ASC")
            ->setDistinct(true);

        $result = $query->execute();

        if($result) {
            while($record = $result->nextRecord()) {
                list($year, $monthName, $monthNumber) = explode('_', $record['DateString']);

                $list->push(ArrayData::create(array(
                    'Year' => $year,
                    'MonthName' => $monthName,
                    'MonthNumber' => $monthNumber,
                    'Link' => $this->Link("date/$year/$monthNumber"),
                    'ArticleCount' => ArticlePage::get()->where("
                            DATE_FORMAT(`Date`,'%Y_%m') = '{$year}{$monthNumber}'
                            AND ParentID = {$this->ID}
                        ")->count()
                )));
            }
        }

        return $list;
    }

}

class ArticleHolder_Controller extends Page_Controller {

    private static $allowed_actions = array(
        'category',
        'region',
        'date'
    );

    protected $articleList;

    public function init(){
        parent::init();
        $this->articleList = ArticlePage::get()->filter(array(
            'ParentID' => $this->ID
        ))->sort('Date DESC');
    }

    public function PaginatedArticles($num = 10){
        return paginatedList::create(
            $this->articleList,
            $this->getRequest()
        )->setPageLength($num);
    }

    public function category(SS_HTTPRequest $r){
        $category = ArticleCategory::get()->byID(
            $r->param('ID')
        );
        if(!$category){
            return $this->httpError(404, 'That category was not found');
        }
        $this->articleList = $this->articleList->filter(array(
            'Categories.ID' => $category->ID
        ));

        return array('SelectedCategory' => $category);
    }

    public function region(SS_HTTPRequest $r){
        $region = Region::get()->byID(
            $r->param('ID')
        );
        if(!$region){
            return $this->httpError(404, 'That region was not found');
        }
        $this->articleList = $this->articleList->filter(array(
            'RegionID' => $region->ID
        ));

        return array('SelectedRegion' => $region);
    }
}