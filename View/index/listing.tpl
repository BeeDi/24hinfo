<div class="container" style="margin-top:60px;">
	<div class="content">
		<div class="page-header">
		    <h1>Liste des équipes inscrites</h1>
	 	</div>
		<section id="listing">
			<?php 
				// Increment TeamIndex
				$teamI = 0;
				// For each rows of the result
				while (($data = fgetcsv($handle, 10000, ",")) !== FALSE) {

					if($teamI%2==0) {
						echo '<div class="row" style="background-color:#f9f9f9; padding: 10px 0;">';
					}
					else {
						echo '<div class="row" style="padding: 10px 0;">';
					}
					//<a mailto="">'.$data[2].'</a>
					echo'
						<div class="span6">
							<h3>'.$data[0].' <small>'.$data[1].'</small></h3>
							
							
						</div>
						<div class="span8">
						<strong>Membres</strong><p>';
						for ($i=3; $i<count($data)-1; $i++) {
							echo $data[$i].', ';
						}
							echo $data[$i].'</div>
						</div>';

					$teamI++;
				}
			?>
	</div>
</div>