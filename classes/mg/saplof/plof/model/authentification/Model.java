package mg.saplof.plof.model.authentification;

import mg.saplof.plof.model.individue.Administrateur;
import mg.saplof.plof.model.individue.Client;

public abstract class model{
  public static Authentificable login(Authentificable object) {
    object.login();
  }
  public static boolean logout(Authentificable personne) {
    object.logout();
  }
}
