package mg.saplof.plof.model.percistence;
import java.util.Set;
import java.util.LinkedHashSet;

public class TypeUtilisateur extends DataObject{
  private String label;

  public TypeUtilisateur() {}
  public TypeUtilisateur(String label) {
    setLabel(label);
  }

  public void setLabel(String label) {
    this.label = label;
  }
  public String getLabel() {
    return label;
  }

  @Override
  public boolean equals(Object other) {
    if(this == null)
      return false;

    if(this == other)
      return true;

    if(!(other instanceof TypeUtilisateur))
      return false;

    if(this.label.compareTo(((TypeUtilisateur)other).getLabel()) == 0)
      return true;

    return false;
  }
}
