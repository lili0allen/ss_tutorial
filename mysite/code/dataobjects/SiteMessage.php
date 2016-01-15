<?php


class SiteMessage extends DataObject{

    public static $db = array(
        "Name" => "Varchar(255)",
        "Type" => "Enum('Information,Warning,Error')",
        "TimesToAppear" => "Enum('1,2,3,4,5')",
        "Active" => "Boolean",
        "ClearMessageParent" => "Boolean",
        "Message" => "HTMLText"

    );

    private static $has_one = array(
        "AppearBeneath" => "SiteTree",
    );

    private static $summary_fields = array(
        "Name", "Type", 'DisplayHierarchy', "Overlap", "State"
    );

    public function getDisplayHierarchy(){
        $selectedNode = DataObject::get_by_id('SiteTree', $this->AppearBeneathID);
        $separator = ' / ';
        $crumbs = array();
        $ancestors = array_reverse($selectedNode->owner->getAncestors()->toArray());
        foreach($ancestors as $ancestor) $crumbs[] = $ancestor->MenuTitle;
        $crumbs[] = $selectedNode->owner->MenuTitle;
        return implode($separator, $crumbs);

    }

    public function getOverlap(){
        $selectedNode = DataObject::get_by_id('SiteTree', $this->AppearBeneathID);
        $messages = SiteMessage::get()->map('ID','AppearBeneathID');
        print_r($messages);
//        foreach($messages as $message){
//
//            if(in_array($message, $selectedNode->owner->getAncestors()->column('ID'))){
//                return $message;
//            }
//
//        }

    }

    protected function onBeforeWrite() {
        parent::onBeforeWrite();
        if ($this->ClearMessageParent) {
            $this->ClearMessageParent = 0;
            $this->AppearBeneathID = 0;
        }
    }

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldsToTab('Root.Main',
            $dropdown = new TreeDropdownField(
                "AppearBeneathID",
                "Message Appears below this page only",
                "SiteTree"
            ),
            'Message'
        );
        $dropdown->setRightTitle('Leave Blank for message to show site wide');
        $fields->addFieldToTab("Root.Main", CheckboxField::create('Active', 'active this message'),'Message');
        $fields->addFieldToTab('Root.Main', CheckboxField::create('ClearMessageParent', 'Reset the message parent field'),'Message');


        $type = $fields->dataFieldByName('Type');
        $type->setRightTitle('Message Background Color: Information = Green, Warning = Yellow, Error = Red');

        $timesToAppear = $fields->dataFieldByName('TimesToAppear');
        $timesToAppear->setRightTitle('Times needed for user to close message before it is hidden');

        return $fields;
    }

    public function getState() {

        if($this->Active) {
            return 'Active';
        }

        return 'Deactive';
    }

    function canCreate($member = null){
        // Limit to only a single SiteMessage Object
        //return (SiteMessage::get()->Count() < 1) ? true : false;
        return true;
    }

    function canView($member = null){
        return true;
    }

    function canDelete($member = null){
        return true;
    }

    function canEdit($member = null){
        return true;
    }
}