<?php

class PropertySearchPage extends Page{

}

class PropertySearchPage_Controller extends Page_Controller{

    public function index(SS_HTTPRequest $request){
        $properties = Property::get()->limit(20);

        if($search = $request->getVar('Keywords')){
            $properties = $properties->filter(
                array(
                    'Title:PartialMatch' => $search
                )
            );
        }

        return array(
            'Results' => $properties
        );
    }

    public function PropertySearchForm(){
        $nights = array();
        foreach(range(1,14) as $i){
            $nights[$i] = "$i night" . (($i>1) ? 's' : '');
        }
        $prices = array();
        foreach(range(100,1000,50) as $i){
            $prices[$i] = '$'.$i;
        }

        $form = Form::create(
            $this,
            __FUNCTION__,
            FieldList::create(
                TextField::create('Keywords')
                    ->setAttribute('placeholder', 'City, State, Country, etc...')
                    ->addExtraClass('form-control'),
                TextField::create('ArrivalDate', 'Arrive on...')
                    ->setAttribute('data-datepicker', true)
                    ->setAttribute('data-date-format', 'DD-MM-YYYY')
                    ->addExtraClass('form-control'),
                DropdownField::create('Nights', 'Stay for...')
                    ->setSource($nights)
                    ->addExtraClass('form-control'),
                DropdownField::create('Bedrooms')
                    ->setSource(ArrayLib::valuekey(range(1,5)))
                    ->addExtraClass('form-control'),
                DropdownField::create('MinPrice', 'Min. price')
                    ->setEmptyString('-- any --')
                    ->setSource($prices)
                    ->addExtraClass('form-control'),
                DropdownField::create('MaxPrice', 'Max. price')
                    ->setEmptyString('-- any --')
                    ->setSource($prices)
                    ->addExtraClass('form-control')
            ),
            FieldList::create(
                FormAction::create('doPropertySearch', 'Search')
                    ->addExtraClass('btn-lg btn-fullcolor')
            )
        );

        $form->setFormMethod('GET')
             ->setFormAction($this->Link())
             ->disableSecurityToken();

        return $form;
    }
}