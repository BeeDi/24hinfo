<div class="container" style="margin-top:60px;">
	<div class="content">
			<div class="page-header">
			    <h1> <span style="text-decoration: line-through;">Inscription des équipes</span> clôturée</h1>
		 	</div>

		<section id="subscribe">
		<!-- 	<div class="page-header">
			    <h1></h1>
		 	</div> -->
			<div class="row">
				<div class="span4">
				<br />
					<p class="label success">Frais d'inscription</p>
					<p>Les frais d'inscription, pris en charge par le département d'origine, sont de <strong>12 euros par étudiant</strong>.</p>
					<p class="label warning">Limite de membres par équipe</p>
					<p>Les équipes doivent être constituées d'un maximum de 6 étudiants et d'un minimum de 4 étudiants.</p>
					<p class="label important">Limite d'équipes par IUT</p>
					<p>Un maximum de <strong>2 équipes</strong> par IUT est autorisé.</p>
					<p class="label important">Limite d'équipes</p>
					<p>Attention, seulement <strong>30 équipes</strong> seront autorisées à s'inscrire aux 24h.</p>

					
				</div>
				<div class="span10">
					<div class="row">
					<form class="form-stacked row" method="post" action="index.php?a=inscription" >
						<div class="span4">
							<fieldset style="padding-left:30px;margin-top:-4px;">
							<legend>Information sur l'équipe</legend>
							<?php
								if(isset($errorE) && !empty($errorE)) {
									foreach ($errorE as $error) {
										echo '<p class="label important">'.$error.'</p>';
									}
								}
							?>
								<div class="clearfix">
									<label for="tInput">Nom de l'équipe</label>
									<div class="input">
										<input id="tInput" type="text" size="30" name="nomE" value="<?php 
										if (!empty($_POST['nomE'])) {echo $_POST['nomE'];} ?>">
									</div>
								</div>
								<div class="clearfix">
									<label for="normalSelect">IUT</label>
									<div class="input">
										<select id="normalSelect" name="iut">
											
									<?php
										if (empty($_POST['iut'])) {
											echo '<option selected="selected"></option>';
										}
										
										$iutIndex = 1;
										foreach ($iuts as $iut) {
											echo '<option value="'.$iutIndex.'" label="'.$iut.'"';

											if (!empty($_POST['iut']) && (int)$_POST['iut']==$iutIndex) {
												echo 'selected="selected"';
											}					
											echo ' >'.$iut.'</option>';
											$iutIndex++;
										}									
									?>
										</select>
									</div>
								</div>
								<div class="clearfix">
									<label for="mInput">Mél de contact</label>
									<div class="input">
										<input id="mInput" type="text" size="30" name="mail" value="<?php 
										if (!empty($_POST['mail'])) {echo $_POST['mail'];} ?>">
									</div>
								</div>
							</fieldset>
						</div>
						<div class="span5">
							<fieldset style="padding-left:50px;margin-top:-4px;">
							<legend>Membres de l'équipe</legend>
								<?php
								if(isset($errorM) && !empty($errorM)) {
									foreach ($errorM as $error) {
										echo '<p class="label important">'.$error.'</p>';
									}
								}

									for ($i=1 ; $i<=6 ; $i++) {
										echo'
										<div class="clearfix">
											<label for="Lname'.$i.'">Nom et Prénom de N°'.$i.'</label>
											<div class="input">
												<input type="text" size="34" name="Lname'.$i.'" id="Lname'.$i.'" value="';
												if (!empty($_POST['Lname'.$i])) {echo $_POST['Lname'.$i];}
												// echo'">';
												// <input class="span3" type="text" size="30" name="Fname'.$i.'" id="Lname'.$i.'" value="';
												// if (!empty($_POST['Fname'.$i])) {echo $_POST['Fname'.$i];}
												echo'">
											</div>
										</div>';
									}						
								?>
							</fieldset>
						</div>
						<!-- <div class="actions" style="margin-left:20px; border: 1px solid #DDDDDD;">
							<input name="subscribe" class="btn primary" type="submit" value="Enregistrer">
							<button class="btn" type="reset">Annuler</button>
						</div> -->
					</form>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>