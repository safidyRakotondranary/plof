package mg.saplof.plof.model.percistence;

public class Commune extends Terrain{
  private District district;

  public Commune() {}
  public Commune(String nom, String description, String code) {
    super(nom, description, code);
  }
  public Commune(String nom, String description, String code, District district) {
    this(nom, description, code);
    setDistrict(district);
  }

  public void setDistrict(District district) {
    this.district = district;
  }
  public District getDistrict() {
    return district;
  }
}
