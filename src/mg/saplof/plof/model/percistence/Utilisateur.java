package mg.saplof.plof.model.percistence;

public class Utilisateur extends Personne implements Authentificable{
  public static final int TYPE_ADMINISTRATEUR = 1;
  public static final int TYPE_CLIENT = 2;
  public static final int VALIDE = 1;
  public static final int NON_VALIDE = 0;

  private String mdp;
  private Integer type;
  private Integer valide;

  public Utilisateur() {}
  public Utilisateur(String mail, String mdp) {
    super.setMail(mail);
    this.setMdp(mdp);
  }
  public Utilisateur(String nom, String prenom, String sexe, String mail, String photoProfil, String mdp, Integer type) throws Exception{
    super(nom, prenom, sexe, mail, photoProfil);
    setMdp(mdp);
    setType(type);
    setValide(NON_VALIDE);
  }
  public Utilisateur(String nom, String prenom, String sexe, String mail, String photoProfil, String mdp, Integer type, Integer valide) throws Exception{
    this(nom, prenom, sexe, mail, photoProfil,mdp,type);
    setValide(valide);
  }


  public void setMdp(String mdp) {
    this.mdp = mdp;
  }
  public void setType(Integer type) throws Exception{
    if(type != TYPE_ADMINISTRATEUR && type != TYPE_CLIENT)
      throw new Exception("Type non autoriser, accepte seulement " + TYPE_ADMINISTRATEUR + " pour administrateur ou " + TYPE_CLIENT + " pour simple utilisateur");
    this.type = type;
  }
  public void setValide(Integer valide) throws Exception{
    if(valide != VALIDE && valide != NON_VALIDE)
      throw new Exception("Statut non autoriser, accepte seulement " + NON_VALIDE + " pour non valider ou " + VALIDE +" pour utilisateur valider");

    this.valide = valide;
  }
  public void setValide(boolean statut) throws Exception{
    Integer valide = statut?VALIDE:NON_VALIDE;
    setValide(valide);
  }
  public String getMdp() {
    return this.mdp;
  }
  public Integer getType() {
    return this.type;
  }
  public Integer getValide() {
    return this.valide;
  }

  public boolean estValide() {
    return (valide==null || valide==NON_VALIDE) ? false:true;
  }


  @Override
  public Authentificable login() throws Exception{
   java.util.List<DataObject> utilisateur = this.findAll();

   if(utilisateur.size() < 1)
    throw new Exception("L'utilisateur n'est pas inscrit dans la base.");
   else if(utilisateur.size() > 1)
    throw new Exception("Des décuplons existent dans la base.");
   else {
     Utilisateur temp = (Utilisateur)utilisateur.get(0);

     if (!temp.estValide())
       throw new Exception("L'utilisateur n'est pas encore validé par l'administrateur.");

      return temp;
   }

  }
  @Override
  public boolean logout() throws Exception{
    return true;
  }
}
