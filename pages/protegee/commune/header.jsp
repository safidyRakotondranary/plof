<%@page import="mg.saplof.plof.model.configuration.Configuration_jsp" %>

<!DOCTYPE HTML>
<html>
  <head>
    <title><%=request.getAttribute("titrePage")!=null?request.getAttribute("titrePage"):"Commune"%></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

    <link href="<%= Configuration_jsp.URL_BASE_CSS + "/bootstrap.min.css" %>" rel='stylesheet' type='text/css' />

    <!-- Custom Theme files -->
    <link href="<%= Configuration_jsp.URL_BASE_CSS + "/style.css" %>" rel='stylesheet' type='text/css' />
    <link href="<%= Configuration_jsp.URL_BASE_CSS + "/font-awesome.css" %>" rel="stylesheet">
    <script src="<%= Configuration_jsp.URL_BASE_JS + "/jquery.min.js" %>"> </script>
    <script src="<%= Configuration_jsp.URL_BASE_JS + "/bootstrap.min.js" %>"> </script>

    <!-- Mainly scripts -->
    <script src="<%= Configuration_jsp.URL_BASE_JS + "/jquery.metisMenu.js" %>"></script>
    <script src="<%= Configuration_jsp.URL_BASE_JS + "/jquery.slimscroll.min.js" %>"></script>

    <!-- Custom and plugin javascript -->
    <link href="<%= Configuration_jsp.URL_BASE_CSS + "/custom.css" %>" rel="stylesheet">
    <script src="<%= Configuration_jsp.URL_BASE_JS + "/custom.js" %>"></script>
    <script src="<%= Configuration_jsp.URL_BASE_JS + "/screenfull.js" %>"></script>
  	<script>
  		$(function () {
  			$('#supported').text('Supported/allowed: ' + !!screenfull.enabled);

  			if (!screenfull.enabled) {
  				return false;
  			}

  			$('#toggle').click(function () {
  				screenfull.toggle($('#container')[0]);
  			});

  		});
  	</script>
  </head>
  <body>
    <div id="wrapper">
    <!----->
      <nav class="navbar-default navbar-static-top" role="navigation">

        <!---Top navigation-->
        <jsp:include page="topMenu.jsp" flush="true"/>
        <!---//Top navigation-->

        <div class="clearfix">

        </div>

        <!---Side navigation-->
        <jsp:include page="sideMenu.jsp" flush="true"/>
        <!---//Side navigation-->

      </nav>
          <div id="page-wrapper" class="gray-bg dashbard-1">
           <div class="content-main">
