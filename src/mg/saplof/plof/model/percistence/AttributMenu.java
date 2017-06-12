package mg.saplof.plof.model.percistence;

import java.util.Set;
import java.util.LinkedHashSet;

public class AttributMenu extends DataObject{
  private Menu menu;
  private String label;
  private String lienIcone;
  private String lienChemin;
  private AttributMenu parent;
  private String idButton;
  private Set<AttributMenu> attributMenuFils = new LinkedHashSet<AttributMenu>();

  public AttributMenu() {}
  public AttributMenu(Menu menu, String label, String lienIcone,  String lienChemin, AttributMenu parent, String idButton) {
    setMenu(menu);
    setLabel(label);
    setLienIcone(lienIcone);
    setParent(parent);
    setIdButton(idButton);
    setLienChemin(lienChemin);
  }

  public void setMenu(Menu menu) {
    this.menu = menu;
  }
  public void setLabel(String label) {
    this.label = label;
  }
  public void setLienIcone(String lienIcone) {
    this.lienIcone = lienIcone;
  }
  public void setLienChemin(String lienChemin) {
    this.lienChemin = lienChemin;
  }
  public void setParent(AttributMenu parent) {
    this.parent = parent;
  }
  public void setIdButton(String idButton) {
    this.idButton = idButton;
  }
  public void setAttributMenuFils(Set<AttributMenu> attributMenuFils) {
    java.util.Iterator iter = attributMenuFils.iterator();
    AttributMenu attribut = null;
    while(iter.hasNext()) {
      attribut = (AttributMenu)iter.next();
      this.attributMenuFils.add(attribut);
    }
  }

  public Menu getMenu() {
    return menu;
  }
  public String getLabel() {
    return label;
  }
  public String getLienIcone() {
    return lienIcone;
  }
  public String getLienChemin() {
    return lienChemin;
  }
  public AttributMenu getParent() {
    return parent;
  }
  public String getIdButton() {
    return idButton;
  }
  public Set<AttributMenu> getAttributMenuFils() {
    return attributMenuFils;
  }
}
