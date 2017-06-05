package mg.saplof.plof.test;

import mg.saplof.plof.model.percistence.Administrateur;

public class Test{
  public static void main(String args[]) {
    System.out.println("Test des fonctions");
    try {
      Administrateur admin = new Administrateur("nom", "prenom", "sexe", "mail", "photoProfil", "mdp");
      admin.save();
    } catch (Exception exp) {
      exp.printStackTrace();
    }

  }
}
