<?php

class SiteMessageExtension extends DataExtension{

    /**
     * Retrieve the Site wide message if set & applicable for the current page
     *
     * @return DataList
     */
    public function SiteMessage($type='hidden-phone'){
        $message = DataList::create('SiteMessage')->first();

        if (!$message || !$message->Active){
            return false;
        }

        $messageCookie = Cookie::get('reece-message');
        if ($messageCookie){
            // Check to see if user has closed the message enough times
            $args = explode('#',$messageCookie);
            if ($args[0] == $message->ID && $args[1] >= $message->TimesToAppear){
                return;
            }
        }

        if ($message->AppearBeneathID){
            // Only show the message to the targeted part of the website and below eg. /bathrooms/products
            $pageToShowMessageUnder = DataObject::get_by_id("SiteTree", $message->AppearBeneathID);

            $currentPage = $this->owner->ID;
            $currentPageAncestors = $this->owner->getSiteAncestry();

            if (($currentPage !== $pageToShowMessageUnder->ID) && !in_array($pageToShowMessageUnder->ID,$currentPageAncestors)){
                // Not under the required ancestor
                return;
            }
        }
        $message->typeClass = $type;
        return $message;
    }

    public function siteWideMessageCacheKey($type='hidden-phone'){
        $siteMessage = DataList::create('SiteMessage')->first();
        $messageKey = '';
        $currentPage = '';
        if (isset($_REQUEST['url'])){
            $currentPage = $_REQUEST['url'];
        }

        if ($siteMessage){
            $lastEdited = $siteMessage->LastEdited;
            $messageKey = $lastEdited . '#' .$siteMessage->ID;

            $messageCookie = Cookie::get('reece-message');
            if ($messageCookie){
                // Need to reflect the number of times a user has closed the message in a particular key
                // otherwise the message will never disappear.
                $args = explode('#',$messageCookie);
                if ($args[0] == $siteMessage->ID){
                    $messageKey .= '#'.$args[1];
                }
            }
        }
        $cacheKey = md5($type.$messageKey.$currentPage);
        return $cacheKey;
    }

} 