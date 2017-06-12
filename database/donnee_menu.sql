--AUTHENTIFICATION
INSERT INTO TYPE_UTILISATEUR (LABELLE_TYPE_UTILISATEUR) values ('administrateur');
INSERT INTO TYPE_UTILISATEUR (LABELLE_TYPE_UTILISATEUR) values ('client');
INSERT INTO TYPE_UTILISATEUR (LABELLE_TYPE_UTILISATEUR) values ('commune');

--MENU
INSERT INTO menu(
	EN_TETE_MENU,
	ID_TYPE_UTILISATEUR
) values ('Menu Administrateur', 1);

INSERT INTO menu(
	EN_TETE_MENU,
	ID_TYPE_UTILISATEUR
) values ('Menu Client', 2);
INSERT INTO menu(
	EN_TETE_MENU,
	ID_TYPE_UTILISATEUR
) values ('Menu Commune', 3);

--ATTRIBUT MENU MENU COMMUNE
INSERT INTO attribut_menu(
	ID_MENU,
	LABEL_ATTRIBUT_MENU,
	LIEN_ICONE_ATTRIBUT_MENU,
	LIEN_CHEMIN_ATTRIBUT_MENU,
	ID_BUTTON_ATTRIBUT_MENU,
	ID_PARENT_ATTRIBUT_MENU
) values (
  3,
  'Demande de certificat',
  'fa fa-certificate',
  '#',
	'demandeDeCertificat',
  null
);
INSERT INTO attribut_menu(
	ID_MENU,
	LABEL_ATTRIBUT_MENU,
	LIEN_ICONE_ATTRIBUT_MENU,
	LIEN_CHEMIN_ATTRIBUT_MENU,
	ID_BUTTON_ATTRIBUT_MENU,
	ID_PARENT_ATTRIBUT_MENU
) values (
  3,
  'Certificat',
  'fa fa-certificate',
  '#',
	'creationDeCertificat',
  null
);

INSERT INTO attribut_menu(
	ID_MENU,
	LABEL_ATTRIBUT_MENU,
	LIEN_ICONE_ATTRIBUT_MENU,
	LIEN_CHEMIN_ATTRIBUT_MENU,
	ID_BUTTON_ATTRIBUT_MENU,
	ID_PARENT_ATTRIBUT_MENU
) values (
  3,
  'Servitude',
  'fa fa-road',
  '#',
	'servitude',
  null
);
INSERT INTO attribut_menu(
	ID_MENU,
	LABEL_ATTRIBUT_MENU,
	LIEN_ICONE_ATTRIBUT_MENU,
	LIEN_CHEMIN_ATTRIBUT_MENU,
	ID_BUTTON_ATTRIBUT_MENU,
	ID_PARENT_ATTRIBUT_MENU
) values (
  3,
  'impression',
  'fa fa-print',
  '#',
	'impression',
  null
);
INSERT INTO attribut_menu(
	ID_MENU,
	LABEL_ATTRIBUT_MENU,
	LIEN_ICONE_ATTRIBUT_MENU,
	LIEN_CHEMIN_ATTRIBUT_MENU,
	ID_BUTTON_ATTRIBUT_MENU,
	ID_PARENT_ATTRIBUT_MENU
) values (
  3,
  'Création',
  'fa fa-pencil',
  '#',
	'creationDemandeCertificat',
  1
);

INSERT INTO attribut_menu(
	ID_MENU,
	LABEL_ATTRIBUT_MENU,
	LIEN_ICONE_ATTRIBUT_MENU,
	LIEN_CHEMIN_ATTRIBUT_MENU,
	ID_BUTTON_ATTRIBUT_MENU,
	ID_PARENT_ATTRIBUT_MENU
) values (
  3,
  'Consultation',
  'fa fa-folder',
  '#',
	'consultationDemandeCertificat',
  1
);
INSERT INTO attribut_menu(
	ID_MENU,
	LABEL_ATTRIBUT_MENU,
	LIEN_ICONE_ATTRIBUT_MENU,
	LIEN_CHEMIN_ATTRIBUT_MENU,
	ID_BUTTON_ATTRIBUT_MENU,
	ID_PARENT_ATTRIBUT_MENU
) values (
  3,
  'Edition',
  'fa fa-edit',
  '#',
	'editionDemandeCertificat',
  1
);


INSERT INTO attribut_menu(
	ID_MENU,
	LABEL_ATTRIBUT_MENU,
	LIEN_ICONE_ATTRIBUT_MENU,
	LIEN_CHEMIN_ATTRIBUT_MENU,
	ID_BUTTON_ATTRIBUT_MENU,
	ID_PARENT_ATTRIBUT_MENU
) values (
  3,
  'Création',
  'fa fa-pencil',
  '#',
	'creationCertificat',
  2
);
INSERT INTO attribut_menu(
	ID_MENU,
	LABEL_ATTRIBUT_MENU,
	LIEN_ICONE_ATTRIBUT_MENU,
	LIEN_CHEMIN_ATTRIBUT_MENU,
	ID_BUTTON_ATTRIBUT_MENU,
	ID_PARENT_ATTRIBUT_MENU
) values (
  3,
  'Consultation',
  'fa fa-folder',
  '#',
	'consultationCertificat',
  2
);
INSERT INTO attribut_menu(
	ID_MENU,
	LABEL_ATTRIBUT_MENU,
	LIEN_ICONE_ATTRIBUT_MENU,
	LIEN_CHEMIN_ATTRIBUT_MENU,
	ID_BUTTON_ATTRIBUT_MENU,
	ID_PARENT_ATTRIBUT_MENU
) values (
  3,
  'Edition',
  'fa fa-edit',
  '#',
	'editionCertificat',
  2
);



-- Pays madagascar
INSERT INTO pays(
	NOM_PAYS,
	DESCRIPTION_PAYS,
	PHOTO_DRAPEAU_PAYS,
	PHOTO_SCEAU_PAYS,
	DEVISE_PAYS,
	HYMME_PAYS,
	PRESIDENT,
	PREMIER_MINISTRE,
	LANGUE_OFFICIELLE
) values (
	'Madagascar',
	'Madagascar, en forme longue la République de Madagascar, en malgache Madagasikara et Repoblikan''i Madagasikara, est un État insulaire d''Afrique constitué d''une grande île de l''océan Indien que le canal de Mozambique sépare du reste du continent. C’est la cinquième plus grande île du monde après l''Australie, le Groenland, la Nouvelle-Guinée et Bornéo. Longue de 1 580 km et large de 580 km, Madagascar couvre une superficie de 587 000 km2. Sa capitale est Antananarivo3 et le pays a pour monnaie l''ariary. Le pays est entouré par d''autres îles et archipels dont l''île Maurice, les Seychelles, les Comores et La Réunion.

		Durant la majeure partie du XIXe siècle, l''île est administrée par le Royaume de Madagascar, cette administration s''exerce dans le cadre du protectorat français de Madagascar après 1883, suite à la première expédition de Madagascar. Le protectorat étant peu appliqué par le gouvernement malgache, la France organise une deuxième expédition militaire à partir de 1895. Les établissements français de Diego Suarez, de Nosy-Be et de l''Ile Sainte-Marie sont rattachés au protectorat le 28 janvier 1896. Les troubles consécutifs à l''intervention militaire française conduiront, en 1897, à la fin de l''autonomie malgache, à l''annexion de l''île par la France et à la réunion de l''ancien protectorat et d''autre territoires français au sein de la colonie de Madagascar et dépendances. Le premier gouvernement autonome malgache revoit le jour le 10 octobre 1958 lorsque la république de Madagascar est proclamée sur le territoire de l''ancien protectorat. En 1960, la République de Madagascar accède à l''indépendance, ce qui fait du pays un des premiers à devenir indépendant dans cette zone de l''océan Indien.

		Le pays est aujourd''hui divisé en six faritany (« provinces »), qui s''articulent autour des villes qui portent le même nom que la province : (1) Antananarivo ou Tananarive, (2) Antsiranana ou Diégo-Suarez, (3) Fianarantsoa, (4) Mahajanga ou Majunga, (5) Toamasina ou Tamatave et (6) Toliara ou Tuléar. Depuis vingt siècles, Madagascar a été façonnée par des peuples venant d''horizons divers : Afrique, Sud-Est asiatique (Indonésie), Proche-Orient, Europe… pour créer la société pluriculturelle malgache actuelle. Ce pays de 23 millions d’habitants est très diversifié sur le plan culturel et compte 18 ethnies distinctes (foko) ou nations autochtones et parlant des langues austronésiennes. Il appartient au groupe des pays les moins avancés selon l’ONU4.',
	'drapeau_madagascar.jpg',
	'sceau_madagascar.jpg',
	'Fitiavana, Tanindrazana, Fandrosoana
		(Amour, Patrie, Progrès)',
	'Ry Tanindrazanay malala ô
		(Ô, Notre chère terre des ancêtres)',
	'Hery Rajaonarimampianina',
	'Olivier Mahafaly Solonandrasana',
	'Malgache et français'
);
