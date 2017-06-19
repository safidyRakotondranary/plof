package mg.saplof.plof.model.percistence;

public class District extends Terrain{
  private Region region;

  public District() {}
  public District(String nom, String description, String code) {
    super(nom, description, code);
  }
  public District(String nom, String description, String code, Region region) {
    this(nom, description, code);
    setRegion(region);
  }

  public void setRegion(Region region) {
    this.region = region;
  }
  public Region getRegion() {
    return region;
  }
}
