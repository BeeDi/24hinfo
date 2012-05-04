<?php
function html($string){
	return utf8_encode(htmlspecialchars($string, ENT_QUOTES));
}

function url_format($string){
	$string = str_replace(' ', '-', strtolower($string));
	return html(preg_replace('#[^a-z0-9-]#', '', $string));
}

// Setup the autoload for class inclusion
spl_autoload_register('generic_autoload');

function generic_autoload($class){
	require_once str_replace('_', '/', $class).'.php';
}

