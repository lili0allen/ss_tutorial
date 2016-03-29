<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 12/31/15
 * Time: 10:38 AM
 */

class Region extends DataObject {

    private static $db = array (
        'Title' => 'Varchar',
        'Description' => 'HTMLText',
        'PopularOnHomepage' => 'Boolean',
    );

    private static $has_one = array(
        'Photo' => 'Image',
        'RegionsPage' => 'RegionsPage'
    );

    private static $has_many = array(
        'Articles' => 'ArticlePage'
    );

    public function getCMSFields() {
        $fields = FieldList::create(
            TextField::create('Title'),
            CheckboxField::create('PopularOnHomepage', 'Popular on homepage'),
            HtmlEditorField::create('Description'),
            $uploader = UploadField::create('Photo')
        );

        $uploader->setFolderName('region-photos');
        $uploader->getValidator()->setAllowedExtensions(array('png','gif','jpeg','jpg'));

        return $fields;
    }

    private static $summary_fields = array(
        'Photo.Filename' => '',
        'Title' => 'Title of region',
        'Description' => 'Short description',
        'PopularOnHomepage.Nice' => 'Popular on homepage'
    );

    public function getGridThumbnail() {
        if($this->Photo()->exists()){
            return $this->Photo()->SetWidth(100);
        }
        return "(no image)";
    }

    public function Link(){
        return $this->RegionsPage()->Link('show/'.$this->ID);
    }

    public function LinkingMode(){
        return Controller::curr()->getRequest()->param('ID') == $this->ID ? 'current' : 'link';
    }

    public function ArticlesLink(){
        $page = ArticleHolder::get()->first();
        if($page){
            return $page->Link('region/'.$this->ID);
        }
    }
} 