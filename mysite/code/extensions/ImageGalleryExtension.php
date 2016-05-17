<?php

class ImageGalleryExtension extends DataExtension {
    public static $many_many = array(
        'Images'			=> 'Image',
    );
    private static $many_many_extraFields = array(
        'Images' => array('SortOrder' => 'Int')
    );

    public function updateCMSFields(\FieldList $fields) {
        parent::updateCMSFields($fields);
        // allow owner to change the save path if they want to specify it
        $saveTo = $this->owner->getFileSavePath();
        $upload = new SortableUploadField('Images', $this->owner->fieldLabel('Images'));
        $upload->setFolderName($saveTo);
        $fields->addFieldToTab('Root.Images', $upload);
    }

    public function getFileSavePath() {
        $class = strtolower(get_class($this->owner));
        if ($this->owner->ID) {
            return 'images/' . $class .'/' . $this->owner->ID;
        }

        return 'images/' . $class;
    }
}
