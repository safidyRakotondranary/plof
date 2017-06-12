package mg.saplof.plof.controler.authentification;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import mg.saplof.plof.model.configuration.Configuration_jsp;

public class Deconnexion extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
      HttpSession session = request.getSession(true);

      String urlDispatch = null;

      String titrePage = null;

      String erreur;

      try {
        session.invalidate();

        titrePage = "";

        urlDispatch = Configuration_jsp.URL_BASE_JSP_AUTHENTIFICATION+"/signin.jsp";

        System.out.println("IN");
      } catch (Exception exp) {
        erreur = exp.getMessage();
        exp.printStackTrace();

        titrePage = "Login";

        //Doit etre dans session car si parameter ne peut pas affciher l'accent
        session.setAttribute("erreur", erreur);

        urlDispatch = Configuration_jsp.URL_BASE_JSP_AUTHENTIFICATION+"/signin.jsp";

      } finally {
        request.setAttribute("titrePage", titrePage);
        /*reqDispatch = request.getRequestDispatcher(urlDispatch);
        reqDispatch.forward(request, response);*/
        response.sendRedirect(urlDispatch);
      }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {

    }
}
