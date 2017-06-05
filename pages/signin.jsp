<%@page import="mg.saplof.plof.model.percistence.Administrateur" %>
<%
 Administrateur admin = new Administrateur("nom", "prenom", "f", "mail", "photoProfil", "mdp");
 admin.save();
 out.println("OVER");

%>
