package mg.saplof.plof.model.percistence;

//import mg.saplof.plof.model.authentification.Model;

public class Administrateur extends PersonneAuthentificable {
  public Administrateur(String nom, String prenom, String sexe, String mail, String photoProfil, String mdp) throws Exception{
    super(nom, prenom, sexe, mail, photoProfil, mdp);
  }
  @Override
  public Authentificable login() {
    return null;
  }
  @Override
  public boolean logout(){
    return true;
  }
}
