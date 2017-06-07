package mg.saplof.plof.model.configuration;

public interface Configuration_jsp {
  public static final String NOM_DOSSIER_JSP = "";
  public static final String NOM_DOSSIER_ASSETS = "assets";
  public static final String NOM_DOSSIER_CSS = "css";
  public static final String NOM_DOSSIER_JS = "js";
  public static final String NOM_DOSSIER_IMAGES = "images";
  public static final String NOM_DOSSIER_FONTS = "fonts";
  public static final String NOM_DOSSIER_PROTEGER = "protegee";
  public static final String NOM_DOSSIER_PROTEGER_ADMINISTRATEUR = "administrateur";
  public static final String NOM_DOSSIER_PROTEGER_CLIENT = "client";
  public static final String NOM_DOSSIER_AUTHENTIFICATION = "authentification";

  public static final String URL_BASE_JSP = Configuration_base.URL_BASE_PROJET + "/" + NOM_DOSSIER_JSP;

  public static final String URL_BASE_JSP_AUTHENTIFICATION = URL_BASE_JSP + "/" + NOM_DOSSIER_AUTHENTIFICATION;
  public static final String URL_BASE_JSP_AUTHENTIFICATION_DEPUIS_PROJET = "/" + NOM_DOSSIER_AUTHENTIFICATION;

  public static final String URL_BASE_JSP_PROTEGE = URL_BASE_JSP + "/" + NOM_DOSSIER_PROTEGER;
  public static final String URL_BASE_JSP_PROTEGE_DEPUIS_PROJET = "/" + NOM_DOSSIER_PROTEGER;

  public static final String URL_BASE_JSP_PROTEGE_ADMINISTRATEUR = URL_BASE_JSP_PROTEGE + "/" + NOM_DOSSIER_PROTEGER_ADMINISTRATEUR;
  public static final String URL_BASE_JSP_PROTEGE_ADMINISTRATEUR_DEPUIS_PROJET = "/" + NOM_DOSSIER_PROTEGER_ADMINISTRATEUR;

  public static final String URL_BASE_JSP_PROTEGE_CLIENT = URL_BASE_JSP_PROTEGE + "/" + NOM_DOSSIER_PROTEGER_CLIENT;
  public static final String URL_BASE_JSP_PROTEGE_CLIENT_DEPUIS_PROJET = "/" + NOM_DOSSIER_PROTEGER_CLIENT;

  public static final String URL_SERVEUR_ASSETS = Configuration_base.URL_BASE_PROJET;
  public static final String URL_BASE_ASSETS = URL_SERVEUR_ASSETS + "/" + NOM_DOSSIER_ASSETS;

  public static final String URL_BASE_JS = URL_BASE_ASSETS + "/" + NOM_DOSSIER_JS;
  public static final String URL_BASE_CSS = URL_BASE_ASSETS + "/" + NOM_DOSSIER_CSS;
  public static final String URL_BASE_FONTS = URL_BASE_ASSETS + "/" + NOM_DOSSIER_FONTS;
}
