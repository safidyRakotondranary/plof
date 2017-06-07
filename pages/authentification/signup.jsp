<%@page import="mg.saplof.plof.model.configuration.Configuration_base" %>
<%@page import="mg.saplof.plof.model.configuration.Configuration_jsp" %>

<jsp:include page="header.jsp" flush="true"/>
	<div class="login">
			<div class="login-bottom">
			<%
				if(request.getAttribute("erreur")!=null) {
					out.print("<div class=\"alert alert-danger\" role=\"alert\">");
        		out.print("<strong>Erreur! </strong>" + request.getAttribute("erreur"));
       		out.print("</div>");
				}
				if(request.getAttribute("notification")!=null) {
					out.print("<div class=\"alert alert-info\" role=\"alert\">");
        		out.print("<strong>A noter! </strong>" + request.getAttribute("notification"));
       		out.print("</div>");
				}
			%>
			<h2>Inscription</h2>
			<form action="<%=Configuration_base.URL_BASE_PROJET%>/ControlInscription" method="post">
				<div class="col-md-8">

					<div class="login-mail">
						<input type="text" name="nom" placeholder="Nom" required="">
						<i class="fa fa-user"></i>
					</div>
					<div class="login-mail">
						<input type="text" name="prenom" placeholder="Prenom" required="">
						<i class="fa fa-user"></i>
					</div>
					<div class="login-mail">
							<i class="fa fa-child"> sexe </i>
							<select name="sexe" class="form-control1">
								<option value="h">Homme</option>
								<option value="f">Femme</option>
							</select>
					</div>
					<div class="login-mail">
							<i class="fa fa-group"> type utilisateur </i>
							<select name="type" class="form-control1">
								<option value="1">Administrateur</option>
								<option value="2">Client</option>
							</select>
					</div>
					<div class="login-mail">
						<input type="text" name="mail" placeholder="Mail" required="">
						<i class="fa fa-envelope"></i>
					</div>
					<div class="login-mail">
						<input type="password" name="mdp" placeholder="mot de passe" required="">
						<i class="fa fa-lock"></i>
					</div>
					<div class="login-mail">
						<input type="password" name="confMdp" placeholder="Confirmation mdp" required="">
						<i class="fa fa-lock"></i>
					</div>
					<div class="login-mail">
						<input type="text" name="pdp" placeholder="Photo de profil" required="">
						<i class="fa fa-photo"></i>
					</div>
				</div>
				<div class="col-md-4 login-do">
					<label class="hvr-shutter-in-horizontal login-sub">
						<input type="submit" value="Submit">
						</label>
						<p>Deja inscrit?</p>
					<a href="<%=Configuration_jsp.URL_BASE_JSP_AUTHENTIFICATION%>/signin.jsp" class="hvr-shutter-in-horizontal">Login</a>
				</div>
			</form>

			<div class="clearfix"> </div>
		</div>
	</div>
<jsp:include page="footer.jsp" flush="true"/>
