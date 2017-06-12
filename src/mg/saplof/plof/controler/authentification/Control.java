package mg.saplof.plof.controler.authentification;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import mg.saplof.plof.model.percistence.Utilisateur;
import mg.saplof.plof.model.percistence.TypeUtilisateur;
import mg.saplof.plof.model.configuration.Configuration_jsp;
import mg.saplof.plof.model.authentification.Model;


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

      String mdpHash = null;

      String urlDispatch = null;

      String titrePage = null;

      TypeUtilisateur typeUtilisateur = null;

      RequestDispatcher reqDispatch = null;

      try {
        //hashage du mot de passe avant test
        mdpHash = Model.getHashMd5(mdp);

        //login
        Utilisateur utilisateurTemporaire = new Utilisateur(mail, mdpHash);
        Utilisateur utilisateur;

        utilisateur = (Utilisateur)utilisateurTemporaire.login();

        typeUtilisateur = utilisateur.getType();

        session.setAttribute("idUtilisateur", utilisateur.getId());

        session.setAttribute("nomUtilisateur", utilisateur.getNom());
        session.setAttribute("photoUtilisateur", utilisateur.getPhotoProfil());
        session.setAttribute("typeUtilisateur", utilisateur.getType());

        titrePage = "Acceuil";

        urlDispatch = Configuration_jsp.URL_BASE_JSP_PROTEGE+ "/" +utilisateur.getType().getLabel()+"/index.jsp";


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
}
