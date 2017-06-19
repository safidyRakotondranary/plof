package mg.saplof.plof.model.percistence;

public class Consistance extends DataObject{
  private String label;

  public Consistance() {}
  public Consistance(String label) {
    setLabel(label);
  }

  public void setLabel(String label) {
    this.label = label;
  }
  public String getLabel() {
    return label;
  }
}
