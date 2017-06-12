package mg.saplof.plof.controler.filter;

import javax.servlet.*;
import javax.servlet.http.*;
import mg.saplof.plof.model.configuration.Configuration_jsp;
import mg.saplof.plof.model.percistence.TypeUtilisateur;


public class AuthentificationFilter implements Filter {
  @Override
  public void init(FilterConfig config) throws ServletException {

  }

  @Override
  public void destroy() {

  }

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
  throws java.io.IOException, ServletException {
    boolean haveSession = this.haveSession(request);

    String path =  ((HttpServletRequest)request).getRequestURI();

    if(haveSession) {
      HttpSession session = ((HttpServletRequest)request).getSession(true);
      TypeUtilisateur typeUtilisateur = (TypeUtilisateur)session.getAttribute("typeUtilisateur");

      ((HttpServletResponse)response).sendRedirect(Configuration_jsp.URL_BASE_JSP + "/" + typeUtilisateur.getLabel() + "/index.jsp");
    }

    chain.doFilter(request, response);

  }
  private boolean haveSession(ServletRequest request) throws ServletException{
    HttpSession session = ((HttpServletRequest)request).getSession(true);
    return session.getAttribute("idUtilisateur") != null;
  }
}
