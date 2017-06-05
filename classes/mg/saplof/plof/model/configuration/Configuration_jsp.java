package mg.saplof.plof.model.configuration;

public interface configuration_jsp {
  public static final NOM_DOSSIER_JSP = "jsp";
  public static final NOM_DOSSIER_ASSETS = "assets";
  public static final NOM_DOSSIER_JS = "js";
  public static final NOM_DOSSIER_CSS = "css";
  public static final NOM_DOSSIER_IMAGES = "images";

  public static final URL_BASE_JSP = URL_BASE_PROJET + "/" + NOM_DOSSIER_JSP;

  public static final URL_SERVEUR_ASSETS = configuration_base.URL_SERVEUR;
  public static final URL_BASE_ASSETS = URL_SERVEUR_ASSETS + "/" + NOM_DOSSIER_ASSETS;

  public static final URL_BASE_JS = URL_BASE_ASSETS + "/" + NOM_DOSSIER_JS;
  public static final URL_BASE_CSS = URL_BASE_ASSETS + "/" + NOM_DOSSIER_CSS;
}
