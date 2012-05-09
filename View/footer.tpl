<footer class="footer">
	<div class="container">
		<div class="row">
			<?php
			if (($handle = fopen(".".ORG, "r+")) !== FALSE) {

				//Read the next line until there is no more
				for ($i=0;$i<2;$i++) {
					if (($data = fgetcsv($handle, 10000, ",")) !== FALSE && !is_null($data)) {
						//opening html markups
						echo'<div class="span7"><address>';
						//Pull the first element of the array (title)
						echo '<strong>'.array_shift($data).'</strong><br />';
						//Continue with the rest of the array (content)
						foreach ($data as $line) {
							echo ' / '.$line;
						}
						//closing html markups
						echo'</address></div>';
					}
				}
			}
			else {
				echo'Erreur de lecture du fichier Organisateur';
			}
			?>
		</div>
	</div>
</footer>

</body>
</html>

