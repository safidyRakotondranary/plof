<%@page import="mg.saplof.plof.model.configuration.Configuration_jsp" %>
<%@page import="mg.saplof.plof.model.configuration.Configuration_base" %>

<div class="navbar-header">
  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
    <span class="sr-only">Toggle navigation</span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
  </button>
  <h1> <a class="navbar-brand" href="index.html">Menu</a></h1>
</div>
<div class=" border-bottom">
  <div class="full-left">
    <section class="full-top">
      <button id="toggle"><i class="fa fa-arrows-alt"></i></button>
    </section>
    <form class=" navbar-left-right">
      <input type="text"  value="Search..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search...';}">
      <input type="submit" value="" class="fa fa-search">
    </form>
    <div class="clearfix"> </div>
  </div>


  <!-- Brand and toggle get grouped for better mobile display -->
  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="drop-men" >
    <ul class=" nav_1">
      <li class="dropdown at-drop">
        <a href="#" class="dropdown-toggle dropdown-at " data-toggle="dropdown">
          <i class="fa fa-globe"></i> <span class="number">5</span>
        </a>
        <ul class="dropdown-menu menu1 " role="menu">
          <li>
            <a href="#">
              <div class="user-new">
                <p>New user registered</p>
                <span>40 seconds ago</span>
              </div>
              <div class="user-new-left">
                <i class="fa fa-user-plus"></i>
              </div>
              <div class="clearfix"> </div>
            </a>
          </li>
          <li>
            <a href="#">
              <div class="user-new">
                <p>New comments waiting approval</p>
                <span>Last Week</span>
              </div>
              <div class="user-new-left">
                <i class="fa fa-rss"></i>
              </div>
              <div class="clearfix"> </div>
            </a>
          </li>
          <li><a href="#" class="view">View all messages</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle dropdown-at" data-toggle="dropdown">
          <span class=" name-caret">
            <%=session.getAttribute("nomUtilisateur")%>
            <i class="caret"></i>
          </span>
          <img src="<%=Configuration_jsp.URL_BASE_IMAGES+"/"+session.getAttribute("photoUtilisateur")%>"></a>
        <ul class="dropdown-menu " role="menu">
          <li><a href="profile.html"><i class="fa fa-user"></i>Edit Profile</a></li>
          <li><a href="inbox.html"><i class="fa fa-envelope"></i>Inbox</a></li>
          <li><a href="calendar.html"><i class="fa fa-calendar"></i>Calender</a></li>
          <li><a href="<%=Configuration_base.URL_BASE_PROJET%>/Deconnexion"><i class="fa fa-sign-out"></i>Déconnexion</a></li>
        </ul>
      </li>
    </ul>
  </div><!-- /.navbar-collapse -->
