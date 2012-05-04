<?php
/*
	Une classe abstraite qui sert de classe père pour les autres classes de contrôleurs.
	La classe possède une propriété publique (static) pour récupérer la variable de connexion avec la BD
	Il y a d'autres propriétés qui serviront dans les classes filles : 
		- une propriété de classe pour récupérer l'instance de contrôleur (Pattern Singleton)
		- une propriété qui pointera vers une instance de la classe modèle correspondante. Cette instance servira à récupérer les données avant leur traitement par le contrôleur.

*/
abstract class Controller_Template{

	protected $selfModel;
	protected static $instance; 
	public static $db; 

	protected function __construct(){
		
	}
	
	/* Chaque contrôleur implante le design pattern «Singleton» */
	public static function getInstance($class_name){
		
		$controller_class_name = 'Controller_'.$class_name;
		
		eval("
			if(!$controller_class_name::\$instance){
				$controller_class_name::\$instance = new $controller_class_name();
			}
			\$ci = $controller_class_name::\$instance;
		");
		return $ci;
		
		
		//	UNIQUEMENT DEPUIS PHP 5.3
		
		// $class = get_called_class();
		// if(!$class::$instance){
		// 	$class::$instance = new $class();
		// }
		// return $class::$instance;
		
	}
}

