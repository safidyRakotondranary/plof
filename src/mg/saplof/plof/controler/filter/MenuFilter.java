package mg.saplof.plof.controler.filter;

import javax.servlet.*;
import javax.servlet.http.*;
import mg.saplof.plof.model.configuration.Configuration_jsp;
import mg.saplof.plof.model.percistence.TypeUtilisateur;
import mg.saplof.plof.model.menu.Model;

public class MenuFilter implements Filter {
  @Override
  public void init(FilterConfig config) throws ServletException {

  }
  @Override
  public void destroy() {

  }

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
  throws java.io.IOException, ServletException {
    RequestDispatcher reqDispatch = null;
    String urlDispatch = null;

    String enTete = null;
    String menu = null;

    HttpSession session = null;

    try {
      session = ((HttpServletRequest)request).getSession(true);

      if(session.getAttribute("menu") != null) {
        chain.doFilter(request, response);
        return;
      }


      TypeUtilisateur typeUtilisateur = (TypeUtilisateur)session.getAttribute("typeUtilisateur");

      menu = Model.toJsp(typeUtilisateur);

      System.out.println("Type: "+typeUtilisateur.getLabel());
      //System.out.println("Menu: "+menu);

      session.setAttribute("menu", menu);
      chain.doFilter(request, response);

    } catch (Exception exp) {
      exp.printStackTrace();
      String erreur = exp.getMessage();
      //request.setAttribute("erreur", erreur);
      urlDispatch = Configuration_jsp.URL_ERROR+"?error="+erreur;

      /*reqDispatch = request.getRequestDispatcher(urlDispatch);
      reqDispatch.forward(request, response);*/
      ((HttpServletResponse)response).sendRedirect(urlDispatch);
    }
  }
}
