<?php
// Setup the webroot
	define('DEV', '/media/www-dev/public/24hinfo');
	define('TEST', '/home/profs/diemert/public_html/24hinfo');
	define('PROD', '');
// Setup the name of the CSV files to read/save the data
	define('SUBSCRIBERS', '/Inscrits.csv');
	define('ORG', '/Organisateur.csv');

// Choose the Test path, or the Production path for your Current constant
// The Current constant will be used whenever needed for absolute path
	//define('CURRENT', DEV);
	define('CURRENT', TEST);
	//define('CURRENT', PROD);
	set_include_path(get_include_path() . PATH_SEPARATOR . CURRENT);

// Include generic functions
	require 'functions.php';



if(empty($_GET['a'])){
	$controller = Controller_Index::getInstance('Index');
	$controller->welcome();
}
else{
	switch($_GET['a']){
		case 'accueil' : 
			$controller = Controller_Index::getInstance('Index');
			$controller->welcome();
			break;
		case 'resultats' : 
			$controller = Controller_Index::getInstance('Index');
			$controller->results();
			break;
		case 'epreuves' : 
			$controller = Controller_Index::getInstance('Index');
			$controller->tournament();
			break;
		case 'inscription':
			$controller = Controller_Index::getInstance('Index');
			$controller->subscribe();
			break;
		case 'inscrits':
			$controller = Controller_Index::getInstance('Index');
			$controller->subscribers();
			break;
		case 'pratique' : 
			$controller = Controller_Index::getInstance('Index');
			$controller->hints();
			break;
		case 'contact' : 
			$controller = Controller_Index::getInstance('Index');
			$controller->contact();
			break;
		
		default:
			Controller_Error::documentNotFound("Page introuvable : URL incorrecte");
	}
}
?>
