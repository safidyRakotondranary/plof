package mg.saplof.plof.controler.filter;


import javax.servlet.*;
import javax.servlet.http.*;
import mg.saplof.plof.model.configuration.Configuration_jsp;
import mg.saplof.plof.model.percistence.TypeUtilisateur;
import mg.saplof.plof.model.percistence.DataObject;
import java.util.List;
import org.hibernate.HibernateException;

public class InscriptionFilter implements Filter {
  @Override
  public void init(FilterConfig config) throws ServletException {

  }
  @Override
  public void destroy() {

  }

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
  throws java.io.IOException, ServletException {
    TypeUtilisateur temp = new TypeUtilisateur();

    try {
      List<DataObject> typeUtilisateurs = temp.findAll();

      System.out.println("\n"+typeUtilisateurs.size());
      ((HttpServletRequest)request).setAttribute("typeUtilisateurs", typeUtilisateurs);
      chain.doFilter(request, response);
    } catch (HibernateException exp) {
      exp.printStackTrace();
      String erreur = exp.getMessage();
      //request.setAttribute("erreur", erreur);
      String urlDispatch = Configuration_jsp.URL_ERROR+"?error="+erreur;

      /*reqDispatch = request.getRequestDispatcher(urlDispatch);
      reqDispatch.forward(request, response);*/
      ((HttpServletResponse)response).sendRedirect(urlDispatch);
    }

  }

}
