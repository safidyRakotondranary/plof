package mg.saplof.plof.model.percistence;

public class Region extends Terrain{
  private Province province;

  public Region() {}
  public Region(String nom, String description, String code) {
    super(nom, description, code);
  }
  public Region(String nom, String description, String code, Province province) {
    this(nom, description, code);
    setProvince(province);
  }

  public void setProvince(Province province) {
    this.province = province;
  }
  public Province getProvince() {
    return province;
  }
}
