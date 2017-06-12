<%@page import="mg.saplof.plof.model.configuration.Configuration_jsp" %>

<!DOCTYPE HTML>
<html>
	<head>
	<title>error</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="application/x-javascript">
			addEventListener("load", function() {
				setTimeout(hideURLbar, 0);
			}, false);
			function hideURLbar(){ window.scrollTo(0,1); }
		</script>
	<link href="<%= Configuration_jsp.URL_BASE_CSS + "/bootstrap.min.css" %>" rel='stylesheet' type='text/css' />
	<!-- Custom Theme files -->
	<link href="<%= Configuration_jsp.URL_BASE_CSS + "/style.css" %>" rel='stylesheet' type='text/css' />
	<link href="<%= Configuration_jsp.URL_BASE_CSS + "/font-awesome.css" %>" rel="stylesheet">
	<script src="<%= Configuration_jsp.URL_BASE_JS + "/jquery.min.js" %>"> </script>
	<script src="<%= Configuration_jsp.URL_BASE_JS + "/bootstrap.min.js" %>"> </script>
	</head>
	<body>
		<div class="four">
			<img src="<%= Configuration_jsp.URL_BASE_IMAGES %>/404.png" alt="" />
			<p><%=request.getParameter("error")%></p>
			<a href="index.html" class="hvr-shutter-in-horizontal">Go To Home</a>
		</div>

	<!---->
	<!--scrolling js-->
		<script src="<%= Configuration_jsp.URL_BASE_JS + "/jquery.nicescroll.js" %>"></script>
		<script src="<%= Configuration_jsp.URL_BASE_JS + "/scripts.js" %>"></script>
		<!--//scrolling js-->
	</body>
</html>
