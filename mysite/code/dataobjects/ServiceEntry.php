<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 5/17/16
 * Time: 2:23 PM
 */

class ServiceEntry extends DataObject {
    private static $db = array(
        'Title'     =>  'Varchar(100)',
        'SubDomain' => 'Varchar(100)',
        'Street'    => 'Varchar(100)',
        'Suburb'    => 'Varchar(100)',
        'State'     => 'Enum("Victoria,New South Wales,Tasmania,Australian Capital Territory,Queensland,Western Australia,Northern Territory,South Australia")',
        'Service'   => 'Varchar(100)',
        'Description' => 'Text',
        'Email'     =>  'Varchar(100)',
        'Phone'     =>  'Varchar(100)',
        'Wechat'    =>  'Varchar(100)',
        'QQ'        =>  'Varchar(100)',
        'Website'   =>  'Varchar(100)',
        'Content'   =>  'HTMLText',
        'IPAddress' =>  'Varchar(100)',
        'Terms' => 'Boolean',
    );
    private static $has_one = array(
        'Logo'  =>  'Image'
    );

    protected function getStateCode(){

        switch($this->State) {

            case 'Victoria':
                $state = 'VIC';
                break;

            case 'New South Wales':
                $state = 'NSW';
                break;

            case 'Tasmania':
                $state = 'TAS';
                break;

            case 'Australian Capital Territory':
                $state = 'ACT';
                break;

            case 'Queensland':
                $state = 'QLD';
                break;

            case 'Western Australia':
                $state = 'WA';
                break;

            case 'Northern Territory':
                $state = 'NT';
                break;

            case 'South Australia':
                $state = 'SA';
                break;

            default:
                $state = null;
                break;
        }

        return $state;
    }

    public function RenderEntry($template){

        return $this->RenderWith($template);
    }

    public function MapShortcode(){
        $address = array(
            $street = $this->Street,
            $suburb = $this->Suburb,
            $state  = $this->State,
            $country = 'Australia'
        );
        $shortcode = '[googlemap,width=500,height=300]'.implode(',',$address).'[/googlemap]';
        return ShortcodeParser::get_active()->parse($shortcode);
    }
} 