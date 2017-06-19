package mg.saplof.plof.model.percistence;

public abstract class Terrain extends DataObject {
  private String nom;
  private String description;
  private String code;

  public Terrain() {}
  public Terrain(String nom, String description, String code) {
    setNom(nom);
    setDescription(description);
    setCode(code);
  }

  public void setNom(String nom) {
    this.nom = nom;
  }
  public void setDescription(String description) {
    this.description = description;
  }
  public void setCode(String code) {
    this.code = code;
  }

  public Stirng getNom() {
    return nom;
  }
  public String getDescription() {
    return description;
  }
  public String getCode() {
    return code;
  }
}
