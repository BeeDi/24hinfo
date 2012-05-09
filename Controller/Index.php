<?php
class Controller_Index extends Controller_Template{

	protected function __construct(){
		parent::__construct();
	}

	public function welcome(){
		$title = utf8_decode("24h des IUT Informatiques"); 

		header('Content-Type: text/html; charset=utf-8');
		require 'View/header.tpl';
		require 'View/index/index.tpl';
		require 'View/footer.tpl';
	}

	public function results(){
		$title = utf8_decode("Les résultats des 24h"); 

		header('Content-Type: text/html; charset=utf-8');
		require 'View/header.tpl';
		require 'View/index/results.tpl';
		require 'View/footer.tpl';
	}

	public function tournament(){
		$title = utf8_decode("Les épreuves des 24h"); 

		header('Content-Type: text/html; charset=utf-8');
		require 'View/header.tpl';
		require 'View/index/epreuves.tpl';
		require 'View/footer.tpl';
	}

	public function subscribers(){
		if (($handle = fopen(".".SUBSCRIBERS, "r")) !== FALSE) {
	       	
	       	$title = utf8_decode("Inscrits au 24h"); 
			header('Content-Type: text/html; charset=utf-8');
			require 'View/header.tpl';
			require 'View/index/listing.tpl';
			require 'View/footer.tpl';
	        
	        fclose($handle);
	    } 
	    else {
	    	Controller_Error::documentNotFound("Page introuvable : Erreur de lecture du fichier d'Inscrits");
	    }
	}

	public function hints(){
		$title = utf8_decode("Préparer les 24h en pratique"); 

		header('Content-Type: text/html; charset=utf-8');
		require 'View/header.tpl';
		require 'View/index/pratique.tpl';
		require 'View/footer.tpl';
	}

	public function contact(){
		// if (($handle = fopen(".".ORG, "r+")) !== FALSE) {

			$title = utf8_decode("Contacter les organisateurs des 24h"); 

			header('Content-Type: text/html; charset=utf-8');
			require 'View/header.tpl';
			require 'View/index/contact.tpl';
			// require 'View/footer.tpl';
		}
		// else {
		// 	Controller_Error::documentNotFound("Page introuvable : Erreur de lecture du fichier Organisateur");
		// }
	}

	public function subscribe(){
		// Define the list of IUTs
		$iuts = array('Aix-en-Provence', 'Amiens', 'Annecy', 'Bayonne - Pays Basque', 'Belfort-Montbéliard' , 'Blagnac', 'Bordeaux', 'Bourg en Bresse', 'Calais - Boulogne', 'Caën', 'Clermont-Ferrand' , 'Dignes-Les-Bains Provence', 'Dijon', 'Grenoble', 'La Rochelle', 'Lannion', 'Laval', 'Le Havre', 'Lens' ,' Lille A - Villeneuve d\'Ascq','Limoges', 'Marne la Vallée', 'Metz', 'Montpellier', 'Montreuil', 'Nancy - Charlemagne', 'Nantes', 'Nice Côte d\'Azur', 'Orléans', 'Orsay', 'Paris 5 - Université Descartes', 'Reims', 'Rodez', 'Saint Dié', 'Strasbourg - Illkirch Graffenstaden', 'Sénart-Fontainebleau', 'Toulouse A - Paul Sabatier', 'Valence', 'Valenciennes - Maubeuge', 'Vannes', 'Villetaneuse', 'Villeurbanne', 'Vélizy');


		// Check if the form has been filled
		if (!empty($_POST['subscribe'])) {
			// When the form is filled: Validation + Error Checking

			// Initialize error message
			$errorE = array();
			$errorM = array();

			// Team Name ? 
			(!empty($_POST['nomE'])) ? $_POST['nomE'] = trim($_POST['nomE']) : $errorE[] = 'Veuillez entrer un nom d\'équipe !';
			// IUT ? 
			(!empty($_POST['iut'])) ? $_POST['iut'] = trim($_POST['iut']) : $errorE[] = 'Veuillez sélectionner votre IUT !';
			// Mail ?  
			if (!empty($_POST['mail'])) {
				$_POST['mail'] = trim($_POST['mail']);
				// Mail valide ?
				if (!$this->checkMail($_POST['mail'])) {
					$errorE[] = 'Veuillez vérfier votre mél de contact !';
				} 
			} 
			else {
				$errorE[] = 'Veuillez sélectionner un mél de contact !';
			}

			// Empty Member's name ?
			$nameError = 0;
			for ($i=1;$i<=6;$i++) {
				(!empty($_POST['Lname'.$i])) ? $_POST['Lname'.$i] = trim($_POST['Lname'.$i]) : $nameError++;
			}
			if ($nameError > 2) {
				$errorM[] = 'Veuillez rajouter '. ($nameError-2) .' membre(s) à votre équipe !';
			}

			// Check if there are no errors in the form
			if (empty($errorM) && empty($errorE)) {

				// No error: Insert data and display the team list
				if (($handle = fopen(CURRENT.SUBSCRIBERS, "r+")) !== FALSE) {

	       			$team = array($_POST['nomE'], $iuts[$_POST['iut']-1], $_POST['mail']);
					for ($i=1;$i<=6;$i++) {
						if (!empty($_POST['Lname'.$i])) {
							$team[] = $_POST['Lname'.$i];
						}
					}
					// print_r($team);
					
					// Go to the end, Add the new team/line, close the file
					$read = fread($handle, filesize(CURRENT.SUBSCRIBERS));
					// fwrite($handle, "\n");
					fputcsv($handle, $team);
					fclose($handle);

					// Send email, Request the list of team
					$this->mailling($_POST['mail'], $_POST['nomE']);
					$this->index();			        
			    }
			    else {
	    			Controller_Error::documentNotFound("Page introuvable : Erreur de lecture des Inscriptions");
	    		} 

			// Error(s) are present, we display the form again !
			}
			else {
				$title = utf8_decode("Vérifiez votre inscription au 24h"); 
				header('Content-Type: text/html; charset=utf-8');
				require 'View/header.tpl';
				require 'View/index/subscribe.tpl';
				require 'View/footer.tpl';
			}
		}
		// If the form has not been filled, first time opening !  
		else {
			$title = utf8_decode("Inscription aux 24h"); 
			header('Content-Type: text/html; charset=utf-8');
			require 'View/header.tpl';
			require 'View/index/subscribe.tpl';
			require 'View/footer.tpl';
		}
	}







	




	public function mailling($mel, $team) {


		$boundary = md5(uniqid(microtime(), TRUE));
		// Subject
		$subject = 'Votre inscription au 24h des IUT Informatiques';

		// Headers
		// $headers .= 'To: '."$mel \r\n";
		$headers = 'From: Organisateurs des 24h des IUT Informatiques <p.bonnot@iut.univ-paris8.fr>'."\r\n"; 
		// $headers .='Content-Type: multipart/alternative;boundary=--'.$boundary."\r\n";
		// $headers .= 'Content-type: text/html; charset=utf-8'."\r\n";
		$headers .= 'Content-Type: text/plain;charset="utf-8"'."\r\n";
		// $headers .= 'Mime-Version: 1.0'."\r\n";
		$headers .= "\r\n";

		// Message
		// $msg = '--'.$boundary."\r\n";
		
		// $msg .= 'Content-transfer-encoding:8bit'."\r\n";

		$msg = 'Bonjour '.$team.",\n".'Bienvenue aux 24h des IUT Informatiques de France. L\'inscription de votre équipe est confirmé.'."\n".'Nous vous enverrons prochainement de plus amples informations sur le déroulement du trophée.'."\n".'Cordialement,'."\n".'Les organisateurs des 24h : Philippe Bonnot et Guylain Delmas'."\n".'(p.bonnot@iut.univ-paris8.fr, g.delmas@iut.univ-paris8.fr)'."\r\n";
		
		// $msg .= '--'.$boundary."\r\n";
		// $msg .= 'Content-type:text/html;charset="utf-8"'."\r\n";
		// $msg .= 'Content-transfer-encoding:8bit'."\r\n";

		// $msg .= '<body><p>Bonjour <strong>'.$team.'</strong></p>
		// <p>Bienvenue au Trophée informatique des IUT de France. L\'inscription de votre équipe est confirmé.</p>
		// <p>Nous vous enverrons prochainement de plus amples informations sur le déroulement du trophée.</p>
		// Cordialement,<br />Les organisateurs du Trophée : <a href="mailto:p.bonnot@iut.univ-paris8.fr">Philippe Bonnot</a> et <a href="mailto:g.delmas@iut.univ-paris8.fr">Guylain Delmas</a></body>.'."\r\n";

		// $msg .= '--'.$boundary."\r\n";
		// Function mail()
		// print_r($headers.$msg);

		$ret = mail($mel, $subject, $msg, $headers);
		/**sending email via PHP's Mail() example:**/
		var_dump($ret);

	}

	public function checkMail($mel) {
		// Auteur : bobocop (arobase) bobocop (point) cz
		// Traduction des commentaires par mathieu

		// Le code suivant est la version du 2 mai 2005 qui respecte les RFC 2822 et 1035
		// http://www.faqs.org/rfcs/rfc2822.html
		// http://www.faqs.org/rfcs/rfc1035.html

		$atom   = '[-a-z0-9!#$%&\'*+\\/=?^_`{|}~]';   // caractères autorisés avant l'arobase
		$domain = '([a-z0-9]([-a-z0-9]*[a-z0-9]+)?)'; // caractères autorisés après l'arobase (nom de domaine)
		                               
		$regex = '/^' . $atom . '+' .   // Une ou plusieurs fois les caractères autorisés avant l'arobase
		'(\.' . $atom . '+)*' .         // Suivis par zéro point ou plus
		                                // séparés par des caractères autorisés avant l'arobase
		'@' .                           // Suivis d'un arobase
		'(' . $domain . '{1,63}\.)+' .  // Suivis par 1 à 63 caractères autorisés pour le nom de domaine
		                                // séparés par des points
		$domain . '{2,63}$/i';          // Suivi de 2 à 63 caractères autorisés pour le nom de domaine

		// test de l'adresse e-mail
		if (preg_match($regex, $mel)) {
		    return true;
		} else {
		    return false;
		}
	}
}

