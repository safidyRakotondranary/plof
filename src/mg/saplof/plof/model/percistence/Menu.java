package mg.saplof.plof.model.percistence;
import java.util.Set;
import java.util.LinkedHashSet;

public class Menu extends DataObject{
  private String enTete;
  private TypeUtilisateur typeUtilisateur;

  private Set<AttributMenu> attributs = new LinkedHashSet<AttributMenu>();

  public Menu() {}
  public Menu(String enTete, TypeUtilisateur typeUtilisateur) {
    setEnTete(enTete);
    setTypeUtilisateur(typeUtilisateur);
  }

  public void setEnTete(String enTete) {
    this.enTete = enTete;
  }
  public void setTypeUtilisateur(TypeUtilisateur typeUtilisateur) {
    this.typeUtilisateur = typeUtilisateur;
  }
  public void setAttributs(Set<AttributMenu> attributs) {
    java.util.Iterator iter = attributs.iterator();
    AttributMenu attribut = null;
    while(iter.hasNext()) {
      attribut = (AttributMenu)iter.next();
      //System.out.println("IN MENU PERCISTENCE: "+attribut.getParent());

      if(attribut.getParent()==null)
        this.attributs.add(attribut);
    }

  }
  public String getEnTete() {
    return enTete;
  }
  public TypeUtilisateur getTypeUtilisateur() {
    return typeUtilisateur;
  }
  public Set<AttributMenu> getAttributs() {
    return attributs;
  }

}
