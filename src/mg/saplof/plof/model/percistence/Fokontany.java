package mg.saplof.plof.model.percistence;

public class Fokontany extends Terrain{
  private Commune commune;

  public Fokontany() {}
  public Fokontany(String nom, String description, String code) {
    super(nom, description, code);
  }
  public Fokontany(String nom, String description, String code, Commune commune) {
    this(nom, description, code);
    setCommune(commune);
  }

  public void setCommune(Commune commune) {
    this.commune = commune;
  }
  public Commune getCommune() {
    return commune;
  }
}
