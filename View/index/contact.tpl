
<div class="container" style="margin-top:60px;">
	<section id="contact">
	<div class="row">
			<div class="span4">
			<a name="contact"></a>
				<address>
					<?php
						//Read the next line
						$data = fgetcsv($handle, 10000, ",");
						//Pull the first element of the array (title)
						echo '<strong>'.array_shift($data).'</strong><br />';
						//Continue with the rest of the array (content)
						foreach ($data as $line) {
							echo $line.'<br />';
						}
					?>
					<!-- 
					<strong>Organisation</strong><br />
					<a href="http://www.iut.univ-paris8.fr/">Département Informatique de l'IUT de Montreuil</a><br />
					140 rue de la Nouvelle France<br />
					93100 MONTREUIL<br />
					01 48 70 37 00<br /> 
					-->
				</address>
			</div>
			<div class="span4">
				<address>
					<?php
						//Read the next line
						$data = fgetcsv($handle, 10000, ",");
						//Pull the first element of the array (title)
						echo '<strong>'.array_shift($data).'</strong><br />';
						//Continue with the rest of the array (content)
						foreach ($data as $line) {
							echo $line.'<br />';
						}
					?>
					<!-- <strong>Responsables</strong><br />
					<a href="mailto:p.bonnot@iut.univ-paris8.fr">Philippe Bonnot</a><br />
					<a href="mailto:g.delmas@iut.univ-paris8.fr">Guylain Delmas</a> -->
				</address>
			</div>
			<div class="span4">
				<address style="color: #808080;">
					<?php
						//Read the next line
						$data = fgetcsv($handle, 10000, ",");
						//Pull the first element of the array (title)
						echo '<strong style="color: #808080;">'.array_shift($data).'</strong><br />';
						//Continue with the rest of the array (content)
						foreach ($data as $line) {
							echo '<small style="color:#808080;">'.$line.'</small><br />';
						}
					?>
					<!-- <strong style="color: #808080;">Webdesign</strong><br />
					<small style="color: #808080;">Benjamin Diemert</small><br />
					<small style="color: #BFBFBF;">Inspiré de <a style="color: #BFBFBF;" href="http://twitter.github.com/bootstrap/">Bootstrap</a></small> -->
				</address>
			</div>
<!-- 			<div class="span2">
				<a href="http://www.iut.univ-paris8.fr/" class="thumbnail">
					<img style="height:48px;" src="../img/iutmontreuil2010_logo.png" alt="L'IUT de Montreuil">
				</a>
			</div> -->
		</div>
	</section>
</div>