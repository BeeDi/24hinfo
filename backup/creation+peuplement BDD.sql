CREATE TABLE IF NOT EXISTS `iut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ville` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE equipe (
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR (30) NOT NULL, 
mail VARCHAR(50) NOT NULL,
deIUT INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (deIUT) REFERENCES iut(id) ON DELETE CASCADE
) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE membre (
nom VARCHAR( 30 ) NOT NULL ,
prenom VARCHAR( 30 ) NOT NULL ,
role ENUM('admin', 'etudiant') NOT NULL ,
dsEquipe INT NOT NULL ,
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
FOREIGN KEY (dsEquipe) REFERENCES equipe(id) ON DELETE CASCADE
) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_general_ci;


INSERT INTO iut (ville) VALUES 
('Dijon'),('Clermont-Ferrand'),('Orléans'),('Aix-en-Provence'),('Amiens'),('Annecy'),('Bayonne, Pays Basque'),('Belfort-Montbéliard'),('Bordeaux'),('Caën'),('Calais - Boulogne'),('Grenoble'),('La Rochelle'),('Lannion'),('Laval'),('Lille A - Villeneuve d\'Ascq'),('Limoges'),('Bourg en Bresse'),('Villeurbanne'),('Marne la Vallée'),('Metz'),('Montpellier'),('Montreuil'),('Nancy - Charlemagne'),('Nantes'), ('Nice Côte d\'Azur'),('Orsay'),('Paris 5 - Université Descartes'), ('Reims'), ('Rodez'),('Saint Dié'),('Sénart-Fontainebleau'),('Strasbourg - Illkirch Graffenstaden'), ('Blagnac'), ('Toulouse A - Paul Sabatier'),('Valence'),('Valenciennes - Maubeuge'),('Vannes'),('Vélizy'),('Le Havre'), ('Dignes-Les-Bains Provence'), ('Lens'),('Villetaneuse'); 


INSERT INTO membre (nom, prenom, role, dsEquipe) VALUES ('Jim', 'Raynor', 'etudiant', '1'),('Tychus', 'Findlay', 'etudiant', '1'),('Ariel', 'Hanson', 'etudiant', '1'),('Gabriel', 'Tosh', 'etudiant', '1'),('Matthew', 'Horner', 'etudiant', '1'),('Sarah', 'Kerrigan', 'etudiant', '1');
INSERT INTO membre (nom, prenom, role, dsEquipe) VALUES ('Carmine', 'Falcone', 'etudiant', '2'),('Harley', 'Quinn', 'etudiant', '2'),('Ra\'s', 'Al Ghul', 'etudiant', '2'),('Killer', 'Croc', 'etudiant', '2'),('Hugo', 'Strange', 'etudiant', '2'),('Poison', 'Ivy', 'etudiant', '2');
INSERT INTO membre (nom, prenom, role, dsEquipe) VALUES ('Ahsoka', 'Tano', 'etudiant', '3'),('Padmé', 'Amidala', 'etudiant', '3'),('Anakin', 'Skywalker', 'etudiant', '3'),('Obi-Wan', 'Kenobi', 'etudiant', '3'),('Mace', 'Windu', 'etudiant', '3'),('Plo', 'Koon', 'etudiant', '3');


