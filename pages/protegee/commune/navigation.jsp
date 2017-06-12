<nav class="navbar-default navbar-static-top" role="navigation">
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
      <jsp:include page="topMenu.jsp" flush="true"/>
    </div>
    <!-- /.navbar-collapse -->

  </div class="clearfix">

  </div>


  <div class="navbar-default sidebar" role="navigation">
    <jsp:include page="sideMenu.jsp" flush="true"/>
  </div>
</nav>
