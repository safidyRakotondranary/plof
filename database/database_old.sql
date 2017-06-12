- Database: plof

-- DROP DATABASE plof;

CREATE DATABASE plof
  WITH OWNER = postgres’’
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'fr_FR.UTF-8'
       LC_CTYPE = 'fr_FR.UTF-8'
       CONNECTION LIMIT = -1;

CREATE TABLE point_interet(
  ID_POINT_INTERET serial PRIMARY kEY,
  TUTELLE varchar(100),
  ADRESSE_POINT_INTERET varchar(100),
  TELEPHONE_POINT_INTERET varchar(100),
  FAX_POINT_INTERET varchar(100),
  EMAIL_POINT_INTERET varchar(100),
  SITE_WEB_POINT_INTERET varchar(100),
  PHOTO_POINT_INTERET varchar(100),
  DESCRIPTION_POINT_INTERET text,
  geometre geometry(Point, 29702)
);
CREATE TABLE pays(
	ID_PAYS serial PRIMARY KEY,
	NOM_PAYS varchar(100),
	DESCRIPTION_PAYS text,
	PHOTO_DRAPEAU_PAYS varchar(100),
	PHOTO_SCEAU_PAYS varchar(100),
	DEVISE_PAYS varchar(100),
	HYMME_PAYS text,
	PRESIDENT varchar(100),
	PREMIER_MINISTRE varchar(100),
	LANGUE_OFFICIELLE varchar(100),
	ID_CAPITAL integer,
  geometry geometry(Polygon,29702),
  surface real
);
CREATE TABLE province(
	ID_PROVINCE serial PRIMARY KEY,
	ID_PAYS integer REFERENCES pays(ID_PAYS),
	NOM_PROVINCE varchar(100),
	DESCRIPTION_PROVINCE text,
	CODE_PROVINCE varchar(100),
  geometry geometry(Polygon,29702),
  surface real
);
CREATE TABLE region(
	ID_REGION serial PRIMARY KEY,
	ID_PROVINCE integer REFERENCES province(ID_PROVINCE),
	NOM_REGION varchar(100),
	DESCRIPTION_REGION text,
	CODE_REGION varchar(100),
  GEOMETRY geometry(Polygon,29702),
  SURFACE real
);
CREATE TABLE disrict(
	ID_DISTRICT serial PRIMARY KEY,
	ID_REGION integer REFERENCES region(ID_REGION),
	NOM_DISTRICT varchar(100),
	DESCRIPTION_DISTRICT text,
	CODE_DISTRICT varchar(100),
  GEOMETRY geometry(Polygon,29702),
  SURFACE real
);
CREATE TABLE commune(
	ID_COMMUNE serial PRIMARY KEY,
	ID_DISTRICT integer REFERENCES disrict(ID_DISTRICT),
	NOM_COMMUNE varchar(100),
	DESCRIPTION_COMMUNE text,
	CODE_COMMUNE varchar(100),
  GEOMETRY geometry(Polygon,29702),
  SURFACE real
);
CREATE TABLE fokontany(
	ID_FOKONTANY serial PRIMARY KEY,
	ID_COMMUNE integer REFERENCES commune(ID_COMMUNE),
	DESCRIPTION_FOKONTANY text,
	NOM_FOKONTANY varchar(100),
	CODE_FOKONTANY varchar(100),
  GEOMETRY geometry(Polygon,29702),
  SURFACE real
);
CREATE TABLE hameau(
	ID_HAMEAU serial PRIMARY KEY,
	ID_FOKONTANY integer REFERENCES fokontany(ID_FOKONTANY),
	NOM_HAMEAU varchar(100),
	DESCRIPTION_HAMEAU text,
	CODE_HAMEAU varchar(100),
  GEOMETRY geometry(Polygon,29702),
  SURFACE real
);
CREATE TABLE parcelle(
	ID_PARCELLE serial PRIMARY KEY,
	ID_HAMEAU integer,
	EST_VALIDE integer, -- Ne l'est plus si parcelle a été morcelée
  GEOMETRY geometry(Polygon,29702),
  SURFACE real
);
CREATE TABLE personne(
	ID_PERSONNE serial PRIMARY KEY,
	NOM_PERSONNE varchar(100),
	PERENOM_PERSONNE varchar(100),
	DATE_NAISSANCE_PERSONNE date,
	LIEU_NAISSANCE_PERSONNE varchar(100),
	SEXE_PERSONNE char,
	ADRESSE_PERSONNE varchar(100),
	PHOTO_RECTO_CIN_PERSONNE varchar(100),
	PHOTO_VERSO_CIN_PERSONNE varchar(100),
	NUM_CIN_PERSONNE varchar(100),
	DATE_CIN_PERSONNE varchar(100),
	LIEU_CIN_PERSONNE varchar(100)
	-- PHOTO_ACTE_NAISSANCE_PERSONNE varchar(100),
	-- NUM_ACTE_NAISSANCE_PERSONNE varchar(100),
	-- DATE_ACTE_NAISSANCE_PERSONNE varchar(100),
	-- LIEU_ACTE_NAISSANCE_PERSONNE varchar(100)
);
CREATE TABLE personne_parcelle(
	ID_PERSONNE_PARCELLE serial PRIMARY KEY,
	ID_PERSONNE integer,
	ID_PARCELLE integer,
	PHOTO_ACTE_DE_VENTE_PARCELLE varchar(100), -- Sonia sisa no fenoina, alaina any @commune
  PHOTO_SITUATION_JURIDIQUE_PARCELLE varchar(100), -- Savoir si parcelle sans litige, alaina any @domaine
  ID_PERSONNE_TEMOIN_1 integer,
	ID_PERSONNE_TEMOIN_2 integer,

	DATE_TRANSACTION date, -- La date ou la transaction a été faite
	EST_VALIDE integer -- Si la personne est encore propiétaire de la parcelle
);
CREATE TABLE demographie(
	ID_DEMOGRAPHIE serial PRIMARY KEY,
	NOMBRE_HABITANT integer,
	DENSITE integer, -- le nombre d'habi
	ANNEE_EFFECTIVITEE integer --
);
CREATE TABLE utilisateur(
	ID_UTILISATEUR serial PRIMARY KEY,
	NOM_UTILISATEUR varchar(100),
	PRENOM_UTILISATEUR varchar(100),
	SEXE_UTILISATEUR char,
	MAIL_UTILISATEUR varchar(100),
  TELEPHONE_UTILISATEUR varchar(100),
	MDP_UTILISATEUR varchar(100),
	PHOTO_PROFIL_UTILISATEUR varchar(100),
  ID_TYPE_UTILISATEUR integer REFERENCES type_utilisateur(ID_TYPE_UTILISATEUR),
  VALIDE_UTILISATEUR integer
);
CREATE TABLE type_utilisateur(
  ID_TYPE_UTILISATEUR serial PRIMARY KEY,
  LABEL_TYPE_UTILISATEUR varchar(100)
);
CREATE TABLE menu(
  ID_MENU serial PRIMARY KEY,
  EN_TETE_MENU varchar(100),
  ID_TYPE_UTILISATEUR integer REFERENCES type_utilisateur(ID_TYPE_UTILISATEUR)
);

CREATE TABLE attribut_menu(
  ID_ATTRIBUT_MENU serial PRIMARY KEY,
  ID_MENU integer REFERENCES menu(ID_MENU),
  LABEL_ATTRIBUT_MENU varchar(100),
  LIEN_ICONE_ATTRIBUT_MENU varchar(100),
  LIEN_CHEMIN_ATTRIBUT_MENU varchar(100),
  ID_BUTTON_ATTRIBUT_MENU varchar(100),
  ID_PARENT_ATTRIBUT_MENU integer
);
