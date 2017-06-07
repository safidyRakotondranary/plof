package mg.saplof.plof.controler.authentification;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import mg.saplof.plof.model.percistence.Utilisateur;
import mg.saplof.plof.model.configuration.Configuration_jsp;

public class Inscription extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {

  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    HttpSession session = request.getSession(true);

    String erreur = null;
    String notification = null;

    RequestDispatcher reqDispatch = null;

    try {
      String nom = request.getParameter("nom");
      String prenom = request.getParameter("prenom");
      String sexe = request.getParameter("sexe");
      Integer type = Integer.parseInt(request.getParameter("type"));
      String mail = request.getParameter("mail");
      String mdp = request.getParameter("mdp");
      String confMdp = request.getParameter("confMdp");
      String pdp = request.getParameter("pdp");

      Utilisateur utilisateurTest;

      //test doublon mail
      utilisateurTest = new Utilisateur(mail,null);
      if(utilisateurTest.findAll().size() > 0)
        throw new Exception("Mail deja enregistée, inserer une autre adresse mail.");

      //test correspondance mot de passe et confirmation mot de passe
      if(mdp.compareTo(confMdp)!=0)
        throw new Exception("Les mots de passe ne corespondent pas.");

      Utilisateur utilisateur = new Utilisateur(nom, prenom, sexe, mail, pdp, mdp, type);
      utilisateur.save();

      notification = "Attente de la confirmation de votre inscription.";
      request.setAttribute("notification", notification);

      reqDispatch = request.getRequestDispatcher(Configuration_jsp.URL_BASE_JSP_AUTHENTIFICATION_DEPUIS_PROJET+"/signin.jsp");

    } catch (Exception exp) {
      erreur = exp.getMessage();

      request.setAttribute("erreur", erreur);
      reqDispatch = request.getRequestDispatcher(Configuration_jsp.URL_BASE_JSP_AUTHENTIFICATION_DEPUIS_PROJET+"/signup.jsp");

    } finally {
      reqDispatch.forward(request, response);
    }
  }
}
