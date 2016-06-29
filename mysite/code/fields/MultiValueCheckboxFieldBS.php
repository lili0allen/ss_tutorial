<?php

/**
 * Created by PhpStorm.
 * User: dev
 * Date: 6/29/16
 * Time: 3:39 PM
 */
class MultiValueCheckboxFieldBS extends MultiValueCheckboxField
{
    /**
     * @todo Explain different source data that can be used with this field,
     * e.g. SQLMap, DataObjectSet or an array.
     *
     * @todo Should use CheckboxField FieldHolder rather than constructing own markup.
     */
    public function Field($properties = array()) {
        Requirements::css(SAPPHIRE_DIR . '/css/CheckboxSetField.css');

        $source = $this->source;
        $values = $this->value;
        if ($values instanceof MultiValueField) {
            $values = $values->getValues();

            if ($this->storeKeys && is_array($values)) {
                // use the keys instead, as that's how we've stored things
                $values = array_keys($values);
            }
        }

        // Get values from the join, if available
        if(is_object($this->form)) {
            $record = $this->form->getRecord();
            if(!$values && $record && $record->{$this->name}) {
                $prop = $record->{$this->name};
                if ($prop &&  $prop instanceof MultiValueField) {
                    $values = $prop->getValues();
                }
            }
        }

        // Source is not an array
        if(!is_array($source) && !is_a($source, 'SQLMap')) {
            if(is_array($values)) {
                $items = $values;
            } else {
                // Source and values are DataObject sets.
                if($values && is_a($values, 'DataObjectSet')) {
                    foreach($values as $object) {
                        if(is_a($object, 'DataObject')) {
                            $items[] = $object->ID;
                        }
                    }
                } elseif($values && is_string($values)) {
                    $items = explode(',', $values);
                    $items = str_replace('{comma}', ',', $items);
                }
            }
        } else {
            // Sometimes we pass a singluar default value thats ! an array && !DataObjectSet
            if(is_a($values, 'DataObjectSet') || is_array($values)) {
                $items = $values;
            } else {
                $items = explode(',', $values);
                $items = str_replace('{comma}', ',', $items);
            }
        }

        if(is_array($source)) {
            unset($source['']);
        }

        $odd = 0;
        $options = '';

        if ($source == null) {
            $source = array();
            $options = "<li>"
                . _t('MultiValueCheckboxField.NoOptions', 'No options available')
                . "</li>";
        }

        if($source) foreach($source as $index => $item) {
            if(is_a($item, 'DataObject')) {
                $key = $item->ID;
                $value = $item->Title;
            } else {
                $key = $index;
                $value = $item;
            }

            $odd = ($odd + 1) % 2;
            $extraClass = $odd ? 'odd' : 'even';
            $extraClass .= ' val' . str_replace(' ', '', $key);
            $itemID = $this->id() . '_' . preg_replace('/[^a-zA-Z0-9]+/', '', $key);
            $checked = '';

            if(isset($items)) {
                $checked = (in_array($key, $items) || in_array($key, $this->defaultItems)) ? ' checked="checked"' : '';
            }

            $disabled = ($this->disabled || in_array($key, $this->disabledItems)) ? $disabled = ' disabled="disabled"' : '';
            $options .= "<label class=\"checkbox-inline\" for=\"$itemID\"><input id=\"$itemID\" name=\"$this->name[$key]\" type=\"checkbox\" value=\"$key\"$checked $disabled class=\"checkbox\" /> $value</label>\n";
        }

        return $options;
    }
}