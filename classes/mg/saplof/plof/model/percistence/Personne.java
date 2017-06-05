package mg.saplof.plof.model.percistence;

public class Personne extends DataObject{
  protected String nom;
  protected String prenom;
  protected String sexe;
  protected String mail;
  protected String photoProfil;

  public Personne() {}
  public Personne(String nom, String prenom, String sexe, String mail, String photoProfil) throws Exception{
    setNom(nom);
    setPrenom(prenom);
    setSexe(sexe);
    setMail(mail);
    setPhotoProfil(photoProfil);
  }
  public String getNom() {
    return nom;
  }
  public String getPrenom() {
    return prenom;
  }
  public String getSexe() {
    return sexe;
  }
  public String getMail() {
    return mail;
  }
  public String getPhotoProfil() {
    return photoProfil;
  }

  public void setNom(String nom) {
    this.nom = nom;
  }
  public void setPrenom(String prenom) {
    this.prenom = prenom;
  }
  public void setSexe(String sexe) throws Exception{
    if(sexe.length() != 1 || sexe.compareTo("f")!=0 ||) sexe.compareTo("m")!=0
      throw new Exception(sexe + " entree, demande \'f\' ou \'m\'.")
    this.sexe = sexe;
  }
  public void setMail(String mail) {
    this.mail = mail;
  }
  public void setPhotoProfil(String photoProfil) {
    this.photoProfil = photoProfil;
  }
}
