<?php
	
class TileBlock extends Block{

	private static $singular_name = 'Tile Block';
	private static $plural_name = 'Tile Blocks';

	private static $db = array(
		'Content' => 'HTMLText'
	);
}
	
