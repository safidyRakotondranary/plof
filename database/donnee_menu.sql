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
