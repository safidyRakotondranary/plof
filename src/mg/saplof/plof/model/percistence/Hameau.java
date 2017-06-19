package mg.saplof.plof.model.percistence;

public class Hameau extends Terrain{
  private Fokontany fokontany;

  public Hameau() {}
  public Hameau(String nom, String description, String code) {
    super(nom, description, code);
  }
  public Hameau(String nom, String description, String code, Fokontany fokontany) {
    this(nom, description, code);
    setFokontany(fokontany);
  }

  public void setFokontany(Fokontany fokontany) {
    this.fokontany = fokontany;
  }
  public Fokontany getFokontany() {
    return fokontany;
  }
}
