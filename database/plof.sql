------------------------------------------------------------
--        Script Postgre
------------------------------------------------------------



------------------------------------------------------------
-- Table: demande_certificat
------------------------------------------------------------
CREATE TABLE public.demande_certificat(
	id_demande_ceritifcat                     serial ,
	numero_demande                            VARCHAR (100) NOT NULL UNIQUE,
	date_demande_certificat                   DATE   ,
	date_de_reconnaissance_demande_certificat DATE   ,
	cout_demande_certificat                   INT   ,
	id_parcelle                               INT   ,
	id_certificat                             INT   ,
	CONSTRAINT prk_constraint_demande_certificat PRIMARY KEY (id_demande_ceritifcat)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: certificat
------------------------------------------------------------
CREATE TABLE public.certificat(
	id_certificat                  serial ,
	numero_certificat              VARCHAR (100)  ,
	date_reconnaissance_certificat DATE   ,
	date_inscription_dans_registre DATE   ,
	id_parcelle                    INT   ,
	id_demande_ceritifcat          INT   ,
	id_etat_certificat             INT   ,
	CONSTRAINT prk_constraint_certificat PRIMARY KEY (id_certificat)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: commune
------------------------------------------------------------
CREATE TABLE public.commune(
	ID_COMMUNE          serial ,
	NOM_COMMUNE         VARCHAR (100)  ,
	DESCRIPTION_COMMUNE VARCHAR (2000)   ,
	CODE_COMMUNE        VARCHAR (100) NOT NULL UNIQUE,
	ID_DISTRICT         INT   ,
	CONSTRAINT prk_constraint_commune PRIMARY KEY (ID_COMMUNE)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: hameau
------------------------------------------------------------
CREATE TABLE public.hameau(
	ID_HAMEAU          serial ,
	NOM_HAMEAU         VARCHAR (100)  ,
	DESCRIPTION_HAMEAU VARCHAR (2000)   ,
	CODE_HAMEAU        VARCHAR (100) NOT NULL UNIQUE,
	ID_FOKONTANY       INT   ,
	CONSTRAINT prk_constraint_hameau PRIMARY KEY (ID_HAMEAU)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: parcelle
------------------------------------------------------------
CREATE TABLE public.parcelle(
	id_parcelle     serial ,
	geometry        geometry(Polygon,29702)  ,
	valide_parcelle CHAR (25)   ,
	ID_HAMEAU       INT   ,
	CONSTRAINT prk_constraint_parcelle PRIMARY KEY (id_parcelle)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: district
------------------------------------------------------------
CREATE TABLE public.district(
	ID_DISTRICT         serial ,
	NOM_DISTRICT        VARCHAR (100)  ,
	DESCRIPTION_DISTRICT VARCHAR (2000)   ,
	CODE_DISTRICT       VARCHAR (100) NOT NULL UNIQUE,
	ID_REGION           INT   ,
	CONSTRAINT prk_constraint_district PRIMARY KEY (ID_DISTRICT)
)WITHOUT OIDS;


------------------------------------------------------------ALTER TABLE public.type_utilisateur ADD CONSTRAINT FK_type_utilisateur_id_menu FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu);
-- Table: province
------------------------------------------------------------
CREATE TABLE public.province(
	ID_PROVINCE          serial ,
	NOM_PROVINCE         VARCHAR (100)  ,
	DESCRIPTION_PROVINCE VARCHAR (2000)   ,
	CODE_PROVINCE        VARCHAR (100) NOT NULL UNIQUE,
	CONSTRAINT prk_constraint_province PRIMARY KEY (ID_PROVINCE)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: region
------------------------------------------------------------
CREATE TABLE public.region(
	ID_REGION          serial ,
	NOM_REGION         VARCHAR (100)  ,
	DESCRIPTION_REGION VARCHAR (2000)   ,
	CODE_REGION        VARCHAR (100) NOT NULL UNIQUE,
	ID_PROVINCE        INT   ,
	CONSTRAINT prk_constraint_region PRIMARY KEY (ID_REGION)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: utilisateur
------------------------------------------------------------
CREATE TABLE public.utilisateur(
	id_utilisateur        serial ,
	nom_utilisateur       VARCHAR (100)  ,
	prenom_utilisateur    VARCHAR (100)  ,
	sexe_utilisateur      CHAR (1)   ,
	mail_utilisateur      VARCHAR (100)  ,
	telephone_utilisateur VARCHAR (100)  ,
	mdp_utilisateur       VARCHAR (100)  ,
	photo_utilisateur     VARCHAR (100)  ,
	valide_utilisateur    INT   ,
	id_type_utilisateur   INT   ,
	CONSTRAINT prk_constraint_utilisateur PRIMARY KEY (id_utilisateur)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: consistance_parcelle
------------------------------------------------------------
CREATE TABLE public.consistance_parcelle(
	id_consistance_parcelle      serial ,
	labelle_consistance_parcelle VARCHAR (100)  ,
	CONSTRAINT prk_constraint_consistance_parcelle PRIMARY KEY (id_consistance_parcelle)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: servitude
------------------------------------------------------------
CREATE TABLE public.servitude(
	id_servitude      serial ,
	date_debut        DATE  NOT NULL ,
	date_fin          DATE  NOT NULL ,
	id_charge         INT   ,
	id_type_servitude INT   ,
	CONSTRAINT prk_constraint_servitude PRIMARY KEY (id_servitude)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: type_servitude
------------------------------------------------------------
CREATE TABLE public.type_servitude(
	id_type_servitude      serial ,
	labelle_type_servitude VARCHAR (100)  ,
	CONSTRAINT prk_constraint_type_servitude PRIMARY KEY (id_type_servitude)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: point_cardinal
------------------------------------------------------------
CREATE TABLE public.point_cardinal(
	id_point_cardinal      serial ,
	labelle_point_cardinal VARCHAR (100)  ,
	CONSTRAINT prk_constraint_point_cardinal PRIMARY KEY (id_point_cardinal)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: limite_point_cardinal
------------------------------------------------------------
CREATE TABLE public.limite_point_cardinal(
	id_limite_point_cardinal serial ,
	id_parcelle              INT   ,
	id_point_cardinal        INT   ,
	id_limite                INT   ,
	CONSTRAINT prk_constraint_limite_point_cardinal PRIMARY KEY (id_limite_point_cardinal)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: limite
------------------------------------------------------------
CREATE TABLE public.limite(
	id_limite      serial ,
	labelle_limite VARCHAR (100)  ,
	CONSTRAINT prk_constraint_limite PRIMARY KEY (id_limite)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: autorisation
------------------------------------------------------------
CREATE TABLE public.autorisation(
	id_autorisation      serial ,
	labelle_autorisation VARCHAR (100)  ,
	CONSTRAINT prk_constraint_autorisation PRIMARY KEY (id_autorisation)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: type_utilisateur
------------------------------------------------------------
CREATE TABLE public.type_utilisateur(
	id_type_utilisateur      serial ,
	labelle_type_utilisateur VARCHAR (100)  ,
	CONSTRAINT prk_constraint_type_utilisateur PRIMARY KEY (id_type_utilisateur)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: type_action
------------------------------------------------------------
CREATE TABLE public.type_action(
	id_type_action      serial ,
	labelle_type_action VARCHAR (100)  ,
	CONSTRAINT prk_constraint_type_action PRIMARY KEY (id_type_action)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: action
------------------------------------------------------------
CREATE TABLE public.action(
	id_action          serial ,
	date_action        DATE   ,
	commentaire_action VARCHAR (100)  ,
	id_utilisateur     INT   ,
	id_type_action     INT   ,
	id_table           INT   ,
	CONSTRAINT prk_constraint_action PRIMARY KEY (id_action)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: table
------------------------------------------------------------
CREATE TABLE public.table(
	id_table      serial ,
	labelle_table VARCHAR (100)  ,
	CONSTRAINT prk_constraint_table PRIMARY KEY (id_table)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: opposition_demande_certificat
------------------------------------------------------------
CREATE TABLE public.opposition_demande_certificat(
	id_opposition_demande_certificat          serial ,
	description_opposition_demande_certificat VARCHAR (100)  ,
	id_demande_ceritifcat                     INT   ,
	id_type_opposition                        INT   ,
	id_reglement                              INT   ,
	CONSTRAINT prk_constraint_opposition_demande_certificat PRIMARY KEY (id_opposition_demande_certificat)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: type_opposition
------------------------------------------------------------
CREATE TABLE public.type_opposition(
	id_type_opposition      serial ,
	labelle_type_opposition VARCHAR (100)  ,
	CONSTRAINT prk_constraint_type_opposition PRIMARY KEY (id_type_opposition)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: reglement
------------------------------------------------------------
CREATE TABLE public.reglement(
	id_reglement                     serial ,
	date_reglement                   DATE   ,
	description_reglement            VARCHAR (2000)   ,
	id_opposition_demande_certificat INT   ,
	id_nature_reglement              INT   ,
	CONSTRAINT prk_constraint_reglement PRIMARY KEY (id_reglement)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: nature_reglement
------------------------------------------------------------
CREATE TABLE public.nature_reglement(
	id_nature_reglement      serial ,
	labelle_nature_reglement VARCHAR (100)  ,
	CONSTRAINT prk_constraint_nature_reglement PRIMARY KEY (id_nature_reglement)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: proprietaire_certificat
------------------------------------------------------------
CREATE TABLE public.proprietaire_certificat(
	id_utilisateur_certificat serial ,
	id_certificat             INT   ,
	id_proprietaire           INT   ,
	CONSTRAINT prk_constraint_proprietaire_certificat PRIMARY KEY (id_utilisateur_certificat)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: proprietaire_demande_certificat
------------------------------------------------------------
CREATE TABLE public.proprietaire_demande_certificat(
	id_proprietaire_demande_certificat serial ,
	id_demande_ceritifcat              INT   ,
	id_proprietaire                    INT   ,
	CONSTRAINT prk_constraint_proprietaire_demande_certificat PRIMARY KEY (id_proprietaire_demande_certificat)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: proprietaire
------------------------------------------------------------
CREATE TABLE public.proprietaire(
	id_proprietaire        serial ,
	nom_proprietaire       VARCHAR (100)  ,
	prenom_proprietaire    VARCHAR (100)  ,
	adresse_proprietaire   VARCHAR (100)  ,
	telephone_proprietaire VARCHAR (100)  ,
	CONSTRAINT prk_constraint_proprietaire PRIMARY KEY (id_proprietaire)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: fokontany
------------------------------------------------------------
CREATE TABLE public.fokontany(
	ID_FOKONTANY          serial ,
	NOM_FOKONTANY         VARCHAR (100)  ,
	DESCRIPTION_FOKONTANY VARCHAR (2000)   ,
	CODE_FOKONTANY        VARCHAR (100) NOT NULL UNIQUE,
	ID_COMMUNE            INT   ,
	CONSTRAINT prk_constraint_fokontany PRIMARY KEY (ID_FOKONTANY)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: charge
------------------------------------------------------------
CREATE TABLE public.charge(
	id_charge       serial ,
	id_servitude    INT   ,
	id_parcelle     INT   ,
	id_hypotheque   INT   ,
	id_autre_charge INT   ,
	CONSTRAINT prk_constraint_charge PRIMARY KEY (id_charge)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: hypotheque
------------------------------------------------------------
CREATE TABLE public.hypotheque(
	id_hypotheque         serial ,
	date_debut_hipotheque DATE   ,
	date_fin_hypotheque   DATE   ,
	valeur_hypotheque     INT   ,
	description_hypoteque VARCHAR (2000)   ,
	id_charge             INT   ,
	CONSTRAINT prk_constraint_hypotheque PRIMARY KEY (id_hypotheque)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: autre_charge
------------------------------------------------------------
CREATE TABLE public.autre_charge(
	id_autre_charge          serial ,
	date_debut_autre_charge  DATE   ,
	date_fin_autre_charge    DATE   ,
	description_autre_charge VARCHAR (2000)   ,
	id_charge                INT   ,
	CONSTRAINT prk_constraint_autre_charge PRIMARY KEY (id_autre_charge)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: creancier
------------------------------------------------------------
CREATE TABLE public.creancier(
	id_creancier  serial ,
	nom_creancier VARCHAR (100)  ,
	id_hypotheque INT   ,
	CONSTRAINT prk_constraint_creancier PRIMARY KEY (id_creancier)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: beneficiaire
------------------------------------------------------------
CREATE TABLE public.beneficiaire(
	id_beneficiaire  serial ,
	nom_beneficiaire VARCHAR (100)  ,
	CONSTRAINT prk_constraint_beneficiaire PRIMARY KEY (id_beneficiaire)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: beneficiaire_servitude
------------------------------------------------------------
CREATE TABLE public.beneficiaire_servitude(
	id_beneficiaire_servitude serial ,
	id_servitude              INT   ,
	id_beneficiaire           INT   ,
	CONSTRAINT prk_constraint_beneficiaire_servitude PRIMARY KEY (id_beneficiaire_servitude)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: parcelle_consistance_parcelle
------------------------------------------------------------
CREATE TABLE public.parcelle_consistance_parcelle(
	id_parcelle_consistance_parcelle serial ,
	id_parcelle                      INT   ,
	id_consistance_parcelle          INT   ,
	CONSTRAINT prk_constraint_parcelle_consistance_parcelle PRIMARY KEY (id_parcelle_consistance_parcelle)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: etat_certificat
------------------------------------------------------------
CREATE TABLE public.etat_certificat(
	id_etat_certificat      serial ,
	labelle_etat_certificat VARCHAR (100)  ,
	CONSTRAINT prk_constraint_etat_certificat PRIMARY KEY (id_etat_certificat)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: menu
------------------------------------------------------------
CREATE TABLE public.menu(
	id_menu             serial ,
	EN_TETE_MENU        VARCHAR (100)  ,
	id_type_utilisateur INT   ,
	CONSTRAINT prk_constraint_menu PRIMARY KEY (id_menu)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: attribut_menu
------------------------------------------------------------
CREATE TABLE public.attribut_menu(
	id_attribut_menu          serial ,
	label_attribut_menu       VARCHAR (100)  ,
	lien_icone_attribut_menu  VARCHAR (100)  ,
	lien_chemin_attribut_menu VARCHAR (100)  ,
	id_button_attribut_menu   VARCHAR (100)  ,
	id_parent_attribut_menu   INT   ,
	id_menu                   INT   ,
	CONSTRAINT prk_constraint_attribut_menu PRIMARY KEY (id_attribut_menu)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: autorisation_type_utilisateur
------------------------------------------------------------
CREATE TABLE public.autorisation_type_utilisateur(
	id_type_utilisateur serial ,
	id_autorisation     serial ,
	CONSTRAINT prk_constraint_autorisation_type_utilisateur PRIMARY KEY (id_type_utilisateur,id_autorisation)
)WITHOUT OIDS;



ALTER TABLE public.demande_certificat ADD CONSTRAINT FK_demande_certificat_id_parcelle FOREIGN KEY (id_parcelle) REFERENCES public.parcelle(id_parcelle);
ALTER TABLE public.demande_certificat ADD CONSTRAINT FK_demande_certificat_id_certificat FOREIGN KEY (id_certificat) REFERENCES public.certificat(id_certificat);
ALTER TABLE public.certificat ADD CONSTRAINT FK_certificat_id_parcelle FOREIGN KEY (id_parcelle) REFERENCES public.parcelle(id_parcelle);
ALTER TABLE public.certificat ADD CONSTRAINT FK_certificat_id_demande_ceritifcat FOREIGN KEY (id_demande_ceritifcat) REFERENCES public.demande_certificat(id_demande_ceritifcat);
ALTER TABLE public.certificat ADD CONSTRAINT FK_certificat_id_etat_certificat FOREIGN KEY (id_etat_certificat) REFERENCES public.etat_certificat(id_etat_certificat);
ALTER TABLE public.commune ADD CONSTRAINT FK_commune_ID_DISTRICT FOREIGN KEY (ID_DISTRICT) REFERENCES public.district(ID_DISTRICT);
ALTER TABLE public.hameau ADD CONSTRAINT FK_hameau_ID_FOKONTANY FOREIGN KEY (ID_FOKONTANY) REFERENCES public.fokontany(ID_FOKONTANY);
ALTER TABLE public.parcelle ADD CONSTRAINT FK_parcelle_ID_HAMEAU FOREIGN KEY (ID_HAMEAU) REFERENCES public.hameau(ID_HAMEAU);
ALTER TABLE public.district ADD CONSTRAINT FK_district_ID_REGION FOREIGN KEY (ID_REGION) REFERENCES public.region(ID_REGION);
ALTER TABLE public.region ADD CONSTRAINT FK_region_ID_PROVINCE FOREIGN KEY (ID_PROVINCE) REFERENCES public.province(ID_PROVINCE);
ALTER TABLE public.utilisateur ADD CONSTRAINT FK_utilisateur_id_type_utilisateur FOREIGN KEY (id_type_utilisateur) REFERENCES public.type_utilisateur(id_type_utilisateur);
ALTER TABLE public.servitude ADD CONSTRAINT FK_servitude_id_charge FOREIGN KEY (id_charge) REFERENCES public.charge(id_charge);
ALTER TABLE public.servitude ADD CONSTRAINT FK_servitude_id_type_servitude FOREIGN KEY (id_type_servitude) REFERENCES public.type_servitude(id_type_servitude);
ALTER TABLE public.limite_point_cardinal ADD CONSTRAINT FK_limite_point_cardinal_id_parcelle FOREIGN KEY (id_parcelle) REFERENCES public.parcelle(id_parcelle);
ALTER TABLE public.limite_point_cardinal ADD CONSTRAINT FK_limite_point_cardinal_id_point_cardinal FOREIGN KEY (id_point_cardinal) REFERENCES public.point_cardinal(id_point_cardinal);
ALTER TABLE public.limite_point_cardinal ADD CONSTRAINT FK_limite_point_cardinal_id_limite FOREIGN KEY (id_limite) REFERENCES public.limite(id_limite);
ALTER TABLE public.action ADD CONSTRAINT FK_action_id_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id_utilisateur);
ALTER TABLE public.action ADD CONSTRAINT FK_action_id_type_action FOREIGN KEY (id_type_action) REFERENCES public.type_action(id_type_action);
ALTER TABLE public.action ADD CONSTRAINT FK_action_id_table FOREIGN KEY (id_table) REFERENCES public.table(id_table);
ALTER TABLE public.opposition_demande_certificat ADD CONSTRAINT FK_opposition_demande_certificat_id_demande_ceritifcat FOREIGN KEY (id_demande_ceritifcat) REFERENCES public.demande_certificat(id_demande_ceritifcat);
ALTER TABLE public.opposition_demande_certificat ADD CONSTRAINT FK_opposition_demande_certificat_id_type_opposition FOREIGN KEY (id_type_opposition) REFERENCES public.type_opposition(id_type_opposition);
ALTER TABLE public.opposition_demande_certificat ADD CONSTRAINT FK_opposition_demande_certificat_id_reglement FOREIGN KEY (id_reglement) REFERENCES public.reglement(id_reglement);
ALTER TABLE public.reglement ADD CONSTRAINT FK_reglement_id_opposition_demande_certificat FOREIGN KEY (id_opposition_demande_certificat) REFERENCES public.opposition_demande_certificat(id_opposition_demande_certificat);
ALTER TABLE public.reglement ADD CONSTRAINT FK_reglement_id_nature_reglement FOREIGN KEY (id_nature_reglement) REFERENCES public.nature_reglement(id_nature_reglement);
ALTER TABLE public.proprietaire_certificat ADD CONSTRAINT FK_proprietaire_certificat_id_certificat FOREIGN KEY (id_certificat) REFERENCES public.certificat(id_certificat);
ALTER TABLE public.proprietaire_certificat ADD CONSTRAINT FK_proprietaire_certificat_id_proprietaire FOREIGN KEY (id_proprietaire) REFERENCES public.proprietaire(id_proprietaire);
ALTER TABLE public.proprietaire_demande_certificat ADD CONSTRAINT FK_proprietaire_demande_certificat_id_demande_ceritifcat FOREIGN KEY (id_demande_ceritifcat) REFERENCES public.demande_certificat(id_demande_ceritifcat);
ALTER TABLE public.proprietaire_demande_certificat ADD CONSTRAINT FK_proprietaire_demande_certificat_id_proprietaire FOREIGN KEY (id_proprietaire) REFERENCES public.proprietaire(id_proprietaire);
ALTER TABLE public.fokontany ADD CONSTRAINT FK_fokontany_ID_COMMUNE FOREIGN KEY (ID_COMMUNE) REFERENCES public.commune(ID_COMMUNE);
ALTER TABLE public.charge ADD CONSTRAINT FK_charge_id_servitude FOREIGN KEY (id_servitude) REFERENCES public.servitude(id_servitude);
ALTER TABLE public.charge ADD CONSTRAINT FK_charge_id_parcelle FOREIGN KEY (id_parcelle) REFERENCES public.parcelle(id_parcelle);
ALTER TABLE public.charge ADD CONSTRAINT FK_charge_id_hypotheque FOREIGN KEY (id_hypotheque) REFERENCES public.hypotheque(id_hypotheque);
ALTER TABLE public.charge ADD CONSTRAINT FK_charge_id_autre_charge FOREIGN KEY (id_autre_charge) REFERENCES public.autre_charge(id_autre_charge);
ALTER TABLE public.hypotheque ADD CONSTRAINT FK_hypotheque_id_charge FOREIGN KEY (id_charge) REFERENCES public.charge(id_charge);
ALTER TABLE public.autre_charge ADD CONSTRAINT FK_autre_charge_id_charge FOREIGN KEY (id_charge) REFERENCES public.charge(id_charge);
ALTER TABLE public.creancier ADD CONSTRAINT FK_creancier_id_hypotheque FOREIGN KEY (id_hypotheque) REFERENCES public.hypotheque(id_hypotheque);
ALTER TABLE public.beneficiaire_servitude ADD CONSTRAINT FK_beneficiaire_servitude_id_servitude FOREIGN KEY (id_servitude) REFERENCES public.servitude(id_servitude);
ALTER TABLE public.beneficiaire_servitude ADD CONSTRAINT FK_beneficiaire_servitude_id_beneficiaire FOREIGN KEY (id_beneficiaire) REFERENCES public.beneficiaire(id_beneficiaire);
ALTER TABLE public.parcelle_consistance_parcelle ADD CONSTRAINT FK_parcelle_consistance_parcelle_id_parcelle FOREIGN KEY (id_parcelle) REFERENCES public.parcelle(id_parcelle);
ALTER TABLE public.parcelle_consistance_parcelle ADD CONSTRAINT FK_parcelle_consistance_parcelle_id_consistance_parcelle FOREIGN KEY (id_consistance_parcelle) REFERENCES public.consistance_parcelle(id_consistance_parcelle);
ALTER TABLE public.menu ADD CONSTRAINT FK_menu_id_type_utilisateur FOREIGN KEY (id_type_utilisateur) REFERENCES public.type_utilisateur(id_type_utilisateur);
ALTER TABLE public.attribut_menu ADD CONSTRAINT FK_attribut_menu_id_menu FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu);
ALTER TABLE public.autorisation_type_utilisateur ADD CONSTRAINT FK_autorisation_type_utilisateur_id_type_utilisateur FOREIGN KEY (id_type_utilisateur) REFERENCES public.type_utilisateur(id_type_utilisateur);
ALTER TABLE public.autorisation_type_utilisateur ADD CONSTRAINT FK_autorisation_type_utilisateur_id_autorisation FOREIGN KEY (id_autorisation) REFERENCES public.autorisation(id_autorisation);
