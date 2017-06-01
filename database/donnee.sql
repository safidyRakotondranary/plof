-- le menu
INSERT INTO menu(
	EN_TETE_MENU
) values ('menu administrateur');

-- la 1ere element du menu 1menu avec ses fils
INSERT INTO attribut_menu(
	ID_MENU,
	LABEL_ATTRIBUT_MENU,
	LIEN_ICONE_ATTRIBUT_MENU,
	LIEN_CHEMIN_ATTRIBUT_MENU,
	ID_PARENT_ATTRIBUT_MENU
) values (
  1,
  'label 1',
  'icone 1',
  'chemin 1',
  null
),(
  1,
  'label 1,1',
  'icone 1,1',
  'chemin 1,1',
  1
);

-- la 2eme element du menu 1 avec ses fils
INSERT INTO attribut_menu(
	ID_MENU,
	LABEL_ATTRIBUT_MENU,
	LIEN_ICONE_ATTRIBUT_MENU,
	LIEN_CHEMIN_ATTRIBUT_MENU,
	ID_PARENT_ATTRIBUT_MENU
) values (
  1,
  'label 2',
  'icone 2',
  'chemin 2',
  null
),(
  1,
  'label 2,1',
  'icone 2,1',
  'chemin 2,1',
  3
),(
  1,
  'label 2,2',
  'icone 2,2',
  'chemin 2,2',
  3
),(
  1,
  'label 2,3',
  'icone 2,3',
  'chemin 2,3',
  3
);
