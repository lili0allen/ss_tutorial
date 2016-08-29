<?php

/**
 * Created by PhpStorm.
 * User: dev
 * Date: 7/21/16
 * Time: 2:17 PM
 */
class WishlistPage extends Page
{

}

class WishlistPage_Controller extends Page_Controller
{
    private static $allowed_actions = array(
        'index','ContactForm', 'SubmitEnquiry'
    );

    public function index(){
        $list = Cookie::get("wishlist");
        if($list){
            $arrayList = explode(",",$list);
            $entries = ServiceEntry::get()->filter('ID', $arrayList);
            return array(
                'ServiceEntries' => $entries
            );
        }else{
            return array();
        }
    }
    
    public function ContactForm(){
        $fields = new FieldList(
            TextField::create('SendFrom', 'Send From')
                ->setAttribute('placeholder', 'Service Emails')
                ->addExtraClass('form-control'),
            TextField::create('SendTo', 'SendTo')
                ->setAttribute('placeholder', 'Your Email')
                ->addExtraClass('form-control'),
            TextField::create('Subject', 'Subject')
                ->setAttribute('placeholder', 'Subject')
                ->addExtraClass('form-control'),
            TextareaField::create('Message', 'Message')
                ->setAttribute('placeholder', 'Message')
                ->addExtraClass('form-control')
        );

        $actions = new FieldList(
            FormAction::create('SubmitEnquiry', 'Submit Enquiry')->addExtraClass('btn btn-primary btn-block')
        );
        $validator = new RequiredFields(
            'SendFrom', 'SendTo', 'Message'
        );
        $Form = new Form($this, __FUNCTION__, $fields, $actions, $validator);

        return $Form;
    }
    
    public function SubmitEnquiry($data, $form){
        $from='allen@easymode.com.au';
        $to='lili0allen@gmail.com';
        $subject='Test';
        $email = new Email();
        $email->setFrom($from)
              ->setTo($to)
              ->setSubject($subject)
              ->setTemplate('Enquiry');
        $email->send();

    }

}