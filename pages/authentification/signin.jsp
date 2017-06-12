<%@page import="mg.saplof.plof.model.configuration.Configuration_base" %>
<%@page import="mg.saplof.plof.model.configuration.Configuration_jsp" %>

<jsp:include page="header.jsp" flush="true"/>
	<div class="login">
		<div class="login-bottom">
			<%
				if(session.getAttribute("erreur")!=null) {
					out.print("<div class=\"alert alert-danger\" role=\"alert\">");
        		out.print("<strong>Erreur! </strong>" + session.getAttribute("erreur"));
       		out.print("</div>");
				}
				if(request.getAttribute("notification")!=null) {
					out.print("<div class=\"alert alert-info\" role=\"alert\">");
        		out.print("<strong>A noter! </strong>" + request.getAttribute("notification"));
       		out.print("</div>");
				}
			%>
			<h2>Login</h2>
			<form action="<%=Configuration_base.URL_BASE_PROJET%>/ControlLogin" method="post">
  			<div class="col-md-7">
    			<div class="login-mail">
    				<input name="mail" type="text" placeholder="Email" required="">
    				<i class="fa fa-envelope"></i>
    			</div>
    			<div class="login-mail">
    				<input name="mdp" type="password" placeholder="Password" required="">
    				<i class="fa fa-lock"></i>
    			</div>
  	    </div>
  			<div class="col-md-5 login-do">
  				<label class="hvr-shutter-in-horizontal login-sub">
  					<input type="submit" value="login">
  					</label>
  					<p>Vous n'avez pas de encore de compte?</p>
  				<a href="<%=Configuration_jsp.URL_BASE_JSP_AUTHENTIFICATION%>/signup.jsp" class="hvr-shutter-in-horizontal">S'inscrire</a>
  			</div>

  			<div class="clearfix"> </div>
			</form>
		</div>
	</div>
<%@include file="footer.jsp"%>
