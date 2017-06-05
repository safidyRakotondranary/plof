package mg.saplof.plof.model.percistence;

public abstract class PersonneAuthentificable extends Personne implements AuthentificationAble{
  private String mdp;

  public PersonneAuthentificable() {}
  public PersonneAuthentificable(String nom, String prenom, String sexe, String mail, String photoProfil, String mdp) throws Exception{
    super(nom, prenom, sexe, mail, photoProfil);
    setMdp(mdp);
  }

  public void setMdp(String mdp) {
    this.mdp = mdp;
  }
  public String getMdp() {
    return this.mdp;
  }

  @Override
  public abstract PersonneAuthentificable login() {}
  @Override
  public abstract boolean logout() {}
}
