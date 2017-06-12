package mg.saplof.plof.controler.filter;

import javax.servlet.*;
import javax.servlet.http.*;
import mg.saplof.plof.model.configuration.Configuration_jsp;

public class ProtectedFilter implements Filter {
  @Override
  public void init(FilterConfig config) throws ServletException {

  }
  @Override
  public void destroy() {

  }

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
  throws java.io.IOException, ServletException {
    RequestDispatcher reqDispatch = null;
    String notification = "Session perdue, veuillez vous loguer.";
    String urlDispatch = null;

    boolean haveSession = this.haveSession(request);

    if(haveSession)
      chain.doFilter(request, response);

    else
      ((HttpServletResponse)response).sendError(HttpServletResponse.SC_UNAUTHORIZED);
  }
  private boolean haveSession(ServletRequest request) throws ServletException{
    HttpSession session = ((HttpServletRequest)request).getSession(true);
    return session.getAttribute("idUtilisateur") != null;
  }
}
