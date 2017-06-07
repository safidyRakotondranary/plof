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
			<h2>Login</h2>
			<form action="<%=Configuration_base.URL_BASE_PROJET%>/ControlLogin" method="post">
  			<div class="col-md-6">
    			<div class="login-mail">
    				<input name="mail" type="text" placeholder="Email" required="">
    				<i class="fa fa-envelope"></i>
    			</div>
    			<div class="login-mail">
    				<input name="mdp" type="password" placeholder="Password" required="">
    				<i class="fa fa-lock"></i>
    			</div>
  		   <a class="news-letter " href="#">
  				 <label class="checkbox1"><input type="checkbox" name="checkbox" ><i> </i>Forget Password</label>
  		   </a>
  	    </div>
  			<div class="col-md-6 login-do">
  				<label class="hvr-shutter-in-horizontal login-sub">
  					<input type="submit" value="login">
  					</label>
  					<p>Do not have an account?</p>
  				<a href="<%=Configuration_jsp.URL_BASE_JSP_AUTHENTIFICATION%>/signup.jsp" class="hvr-shutter-in-horizontal">Signup</a>
  			</div>

  			<div class="clearfix"> </div>
			</form>
		</div>
	</div>
<jsp:include page="footer.jsp" flush="true"/>
