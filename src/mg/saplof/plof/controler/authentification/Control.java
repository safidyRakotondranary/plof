package mg.saplof.plof.controler.authentification;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import mg.saplof.plof.model.percistence.Utilisateur;
import mg.saplof.plof.model.configuration.Configuration_jsp;

public class Control extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
      HttpSession session = request.getSession(true);

      String mail = request.getParameter("mail");
      String mdp = request.getParameter("mdp");
      String erreur = null;

      Utilisateur utilisateurTemporaire = new Utilisateur(mail, mdp);
      Utilisateur utilisateur;

      RequestDispatcher reqDispatch = null;

      try {
        utilisateur = (Utilisateur)utilisateurTemporaire.login();

        session.setAttribute("idUtilisateur", utilisateur.getId());

        if(utilisateur.getType() == Utilisateur.TYPE_ADMINISTRATEUR)
          reqDispatch = request.getRequestDispatcher(Configuration_jsp.URL_BASE_JSP_PROTEGE_ADMINISTRATEUR_DEPUIS_PROJET+"/index.jsp");
        else if(utilisateur.getType() == Utilisateur.TYPE_CLIENT)
          reqDispatch = request.getRequestDispatcher(Configuration_jsp.URL_BASE_JSP_PROTEGE_CLIENT_DEPUIS_PROJET+"/index.jsp");

      } catch (Exception exp) {
        erreur = exp.getMessage();
        request.setAttribute("erreur", erreur);
        reqDispatch = request.getRequestDispatcher(Configuration_jsp.URL_BASE_JSP_AUTHENTIFICATION_DEPUIS_PROJET+"/signin.jsp");

      } finally {
        reqDispatch.forward(request, response);
      }
    }
}
