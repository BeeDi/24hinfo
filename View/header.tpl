<?php echo '<?xml version="1.0" encoding="utf-8"?>'; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr-FR" lang="fr-FR">
<head>
	<title><?php echo html($title); ?></title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<!-- <link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css"> -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	
	<script src="./js/bootstrap-scrollspy.js"></script>
	<script src="./js/bootstrap-alerts.js"></script>
</head>
<body>
	<div class="topbar" data-scrollspy="scrollspy">
		<div class="fill">
			<div class="container">
				
				<h3><a href="index.php">Accueil</a></h3>
				<ul class="nav">
					<li <?php if (!empty($_GET['a']) && $_GET['a']== 'resultats') {echo 'class="active"';}?>	
						><a href="index.php?a=resultats">Résultats</a></li>

					<li <?php if (!empty($_GET['a']) && $_GET['a']== 'epreuves') {echo 'class="active"';}?>	
						><a href="index.php?a=epreuves">Épreuves</a></li>

					<li style="color:#606060;padding-bottom:11px;padding-left:10px; padding-right:10px; padding-top:10px; text-decoration:none;">Inscription</li>

					<li <?php if (!empty($_GET['a']) && $_GET['a']== 'inscrits') {echo 'class="active"';}?>
						><a href="index.php?a=inscrits">Liste des inscrits</a></li>
					<li <?php if (!empty($_GET['a']) && $_GET['a']== 'pratique') {echo 'class="active"';}?>
						><a href="index.php?a=pratique">Infos pratiques</a></li>
					<li <?php if (!empty($_GET['a']) && $_GET['a']== 'contact') {echo 'class="active"';}?>
						><a href="index.php?a=contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</div>
	

