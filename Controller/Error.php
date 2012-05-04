<?php
abstract class Controller_Error extends Controller_Template{

	public static function documentNotFound($title){
		header('HTTP/1.1 404 Not Found');
		header('Content-Type: text/html; charset=utf-8');
		include 'View/header.tpl';
		include 'View/error/index.tpl';
		include 'View/footer.tpl';
	}
}

