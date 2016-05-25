<?php
/**
 * Created by PhpStorm.
 * User: dev
 * Date: 5/23/16
 * Time: 10:13 AM
 */

class FrontendHtmlEditorField extends HtmlEditorField{
    public function __construct($name, $title = null, $value = '') {
        parent::__construct($name, $title, $value);
        self::include_js();
    }

    public static function include_js() {
        parent::include_js();
        Requirements::customScript("ssTinyMceConfig.editor_selector='frontendhtmleditor';tinyMCE.init(ssTinyMceConfig);");
    }
}