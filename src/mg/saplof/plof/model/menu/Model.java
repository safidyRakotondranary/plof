package mg.saplof.plof.model.menu;

import mg.saplof.plof.model.percistence.Menu;
import mg.saplof.plof.model.percistence.AttributMenu;
import mg.saplof.plof.model.percistence.TypeUtilisateur;
import mg.saplof.plof.model.percistence.DataObject;
import mg.saplof.plof.model.configuration.Configuration_base;
import java.util.Set;

public abstract class Model{
  private static String toJsp(Set<AttributMenu> attributs, int etape) {
    java.util.Iterator iter = attributs.iterator();
    AttributMenu attribut = null;
    String result = "";

    if(attributs == null || attributs.size() == 0) return result;

    result = (etape == 0)?
      "<ul class=\"nav\" id=\"side-menu\">":
      "<ul class=\"nav nav-second-level\">";

    while(iter.hasNext()) {
      attribut = (AttributMenu)iter.next();

      result += "<li>";
      //result += "<li>";

        result += "<a id=\""+attribut.getIdButton()+"\" href=\""+ Configuration_base.URL_BASE_PROJET +"/"+attribut.getLienChemin()+ "\" class=\" hvr-bounce-to-right\">";
          result += "<i class=\"" +attribut.getLienIcone()+ " nav_icon\"></i>";
          result += "<span class=\"nav-label\">" +attribut.getLabel()+ "</span>";

          if(attribut.getAttributMenuFils() != null && attribut.getAttributMenuFils().size() != 0)
            result += "<span class=\"fa arrow\"></span>";

        result += "</a>";
        result += toJsp(attribut.getAttributMenuFils(), etape + 1);

      result += "</li>";
    }
    result += "</ul>";

    return result;
  }
  public static String toJsp(TypeUtilisateur typeUtilisateur) throws Exception {
    Menu menu = new Menu();
    //menu.setTypeUtilisateur(typeUtilisateur);

    //System.out.println("Menu: "+menu);

    java.util.List<DataObject> menus = menu.findAll();

    java.util.Iterator iter = menus.iterator();

    while(iter.hasNext()) {
      menu = (Menu)iter.next();
      if(menu.getTypeUtilisateur().equals(typeUtilisateur))
        break;
    }

    Set<AttributMenu> attributs = menu.getAttributs();

    return toJsp(attributs, 0);
  }
}
