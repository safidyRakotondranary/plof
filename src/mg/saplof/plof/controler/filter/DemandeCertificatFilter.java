package mg.saplof.plof.controler.filter;


import javax.servlet.*;
import javax.servlet.http.*;
import mg.saplof.plof.model.configuration.Configuration_jsp;
import mg.saplof.plof.model.percistence.Consistance;
import mg.saplof.plof.model.percistence.DataObject;
import java.util.List;
import org.hibernate.HibernateException;

public class DemandeCertificatFilter implements Filter {
  @Override
  public void init(FilterConfig config) throws ServletException {
    System.out.println("IN");
  }
  @Override
  public void destroy() {

  }

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
  throws java.io.IOException, ServletException {
    System.out.println("IN");
    Consistance temp = new Consistance();


    try {
      List<DataObject> consistances = temp.findAll();


      ((HttpServletRequest)request).setAttribute("consistances", consistances);
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
