package mg.saplof.plof.model.configuration;

public interface Configuration_jsp {
  public static final String NOM_DOSSIER_JSP = "jsp";
  public static final String NOM_DOSSIER_ASSETS = "assets";
  public static final String NOM_DOSSIER_CSS = "css";
  public static final String NOM_DOSSIER_JS = "js";
  public static final String NOM_DOSSIER_IMAGES = "images";

  public static final String URL_BASE_JSP = Configuration_base.URL_BASE_PROJET + "/" + NOM_DOSSIER_JSP;

  public static final String URL_SERVEUR_ASSETS = Configuration_base.URL_SERVEUR;
  public static final String URL_BASE_ASSETS = URL_SERVEUR_ASSETS + "/" + NOM_DOSSIER_ASSETS;

  public static final String URL_BASE_JS = URL_BASE_ASSETS + "/" + NOM_DOSSIER_JS;
  public static final String URL_BASE_CSS = URL_BASE_ASSETS + "/" + NOM_DOSSIER_CSS;
}
