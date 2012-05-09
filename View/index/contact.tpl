
<div class="container" style="margin-top:60px;">
	<section id="contact">
		<div class="row">
			<a name="contact"></a>
			<?php
			//Read the next line until there is no more
			while (($data = fgetcsv($handle, 10000, ",")) !== FALSE && !is_null($data)) {
				//opening html markups
				echo'<div class="span4"><address>';
				//Pull the first element of the array (title)
				echo '<strong>'.array_shift($data).'</strong><br />';
				//Continue with the rest of the array (content)
				foreach ($data as $line) {
					echo $line.'<br />';
				}
				//closing html markups
				echo'</address></div>';
			}
			?>
		</div>
	</section>
</div>