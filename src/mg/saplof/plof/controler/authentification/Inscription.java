package mg.saplof.plof.controler.authentification;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import mg.saplof.plof.model.percistence.Utilisateur;
import mg.saplof.plof.model.percistence.TypeUtilisateur;
import mg.saplof.plof.model.configuration.Configuration_jsp;
import mg.saplof.plof.model.authentification.Model;

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
    String urlDispatch = null;

    try {
      String nom = request.getParameter("nom");
      String prenom = request.getParameter("prenom");
      String sexe = request.getParameter("sexe");
      Integer type = Integer.parseInt(request.getParameter("type"));
      String mail = request.getParameter("mail");
      String mdp = request.getParameter("mdp");
      String confMdp = request.getParameter("confMdp");
      String pdp = request.getParameter("pdp");

      TypeUtilisateur typeUtilisateur = new TypeUtilisateur();
      typeUtilisateur.setId(Integer.valueOf(type));
      typeUtilisateur = (TypeUtilisateur)typeUtilisateur.findAll().get(0);

      String mdpHash = null;
      Utilisateur utilisateurTest;

      //test doublon mail
      utilisateurTest = new Utilisateur(mail,null);
      if(utilisateurTest.findAll().size() > 0)
        throw new Exception("Mail deja utilisée, inserer une autre adresse mail.");

      //test correspondance mot de passe et confirmation mot de passe
      if(mdp.compareTo(confMdp)!=0)
        throw new Exception("Les mots de passes ne corespondent pas.");

      //hashage du mot de passe
      mdpHash = Model.getHashMd5(mdp);

      //insertion de l'utilisateur avec mot de passe hashé dans la base
      Utilisateur utilisateur = new Utilisateur(nom, prenom, sexe, mail, pdp, mdpHash, typeUtilisateur);
      utilisateur.save();

      notification = "Attente de la confirmation de votre inscription.";
      request.setAttribute("notification", notification);

      urlDispatch = Configuration_jsp.URL_BASE_JSP_AUTHENTIFICATION_DEPUIS_PROJET+"/signin.jsp";

    } catch (Exception exp) {
      erreur = exp.getMessage();

      request.setAttribute("erreur", erreur);
      urlDispatch = Configuration_jsp.URL_BASE_JSP_AUTHENTIFICATION_DEPUIS_PROJET+"/signup.jsp";

    } finally {
      reqDispatch = request.getRequestDispatcher(urlDispatch);
      reqDispatch.forward(request, response);
    }
  }

}
