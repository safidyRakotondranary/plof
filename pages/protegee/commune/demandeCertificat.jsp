<%@page import="mg.saplof.plof.model.configuration.Configuration_jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="consistances" value='${requestScope["consistances"]}' />

<jsp:include page="header.jsp" flush="true"/>
        <!--banner-->
        <div class="banner">
          <h2>
            <a href="index.html">Home</a>
            <i class="fa fa-angle-right"></i>
            <span>Demande certificat</span>
          </h2>
        </div>
        <!--//banner-->
        <div class="container">

         <!-- Modal -->
         <div class="modal fade" id="detailDemande" role="dialog">
           <div class="modal-dialog">

             <!-- Modal content-->
             <div class="modal-content">
               <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 style="color:green;"><span class="fa fa-lock"></span> Entrer detail demande. </h4>
               </div>
               <div class="modal-body">
                 <div class="validation-form">
              	<!---->

                     <form>
                      <div class="col-md-12 form-group1 group-mail">
                        <label class="control-label">Numero demande</label>
                        <input type="text" placeholder="Numero demande" required="">
                      </div>
                      <div class="clearfix"> </div>
                    	<div class="vali-form">
                        <div class="col-md-6 form-group1">
                          <label class="control-label">Date demande</label>
                          <input type="date" placeholder="Date demande" required="">
                        </div>
                        <div class="col-md-6 form-group1 form-last">
                          <label class="control-label">Date de reconnaissance</label>
                          <input type="date" placeholder="Date de reconnaissance" required="">
                        </div>
                        <div class="clearfix"> </div>
                      </div>
                      <div class="panel panel-default">
                        <div class="panel-heading">Consistance</div>
                        <div class="panel-body">

                          <c:forEach var="consistance" items="${consistances}">
                            <label class="control-label">
                              <input id="<c:out value="${consistance.id}"/>" type="checkbox"> <c:out value="${consistance.label}"/>

                            </label>
          								</c:forEach>

                        </div>
                      </div>
                      <div class="clearfix"> </div>

                      <div class="vali-form">
                        <div class="col-md-6 form-group1">
                          <button type="button" data-toggle="modal" data-target="#list-opposition" class="btn btn-default">Oppositions</button>
                        </div>
                        <div class="col-md-6 form-group1 form-last">
                          <button type="submit" class="btn btn-default">Demandeurs</button>
                        </div>
                        <div class="clearfix"> </div>
                      </div>

                      <div class="col-md-12 form-group1 group-mail">
                        <label class="control-label">Cout</label>
                        <input type="text" placeholder="Cout" required="">
                      </div>
                      <div class="clearfix"> </div>
                      <div class="col-md-12 form-group2 group-mail">
                         <label class="control-label">Province</label>
                         <select name="province">
                         	<option value="">English</option>
                         	<option value="">Japanese</option>
                         	<option value="">Russian</option>
                         	<option value="">Arabic</option>
                         	<option value="">Spanish</option>
                         </select>
                       </div>
                      <div class="col-md-12 form-group2 group-mail">
                         <label class="control-label">Region</label>
                         <select name="region">
                         	<option value="">English</option>
                         	<option value="">Japanese</option>
                         	<option value="">Russian</option>
                         	<option value="">Arabic</option>
                         	<option value="">Spanish</option>
                         </select>
                       </div>
                       <div class="clearfix"> </div>
                       <div class="col-md-12 form-group2 group-mail">
                          <label class="control-label">District</label>
                          <select name="district">
                          	<option value="">English</option>
                          	<option value="">Japanese</option>
                          	<option value="">Russian</option>
                          	<option value="">Arabic</option>
                          	<option value="">Spanish</option>
                          </select>
                        </div>
                        <div class="clearfix"> </div>

                        <div class="col-md-12 form-group2 group-mail">
                           <label class="control-label">Commune</label>
                           <select name="commune">
                           	<option value="">English</option>
                           	<option value="">Japanese</option>
                           	<option value="">Russian</option>
                           	<option value="">Arabic</option>
                           	<option value="">Spanish</option>
                           </select>
                         </div>
                         <div class="clearfix"> </div>

                         <div class="col-md-12 form-group2 group-mail">
                            <label class="control-label">Fokontany</label>
                            <select name="fokontany">
                            	<option value="">English</option>
                            	<option value="">Japanese</option>
                            	<option value="">Russian</option>
                            	<option value="">Arabic</option>
                            	<option value="">Spanish</option>
                            </select>
                          </div>
                          <div class="clearfix"> </div>




                         <div class="col-md-12 form-group">
                           <button type="submit" class="btn btn-primary">Submit</button>
                           <button type="reset" class="btn btn-default">Reset</button>
                         </div>
                       <div class="clearfix"> </div>
                     </form>
                  </div>
               </div>
               <div class="modal-footer">
                 <button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="fa fa-remove"></span> Cancel</button>
               </div>
             </div>
           </div>
         </div>
         <div class="modal" id="list-opposition" role="dialog">
           <div class="modal-dialog">

             <!-- Modal content-->
             <div class="modal-content">
               <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 style="color:green;"><span class="fa fa-lock"></span> Opposition a la demande de certificat </h4>
               </div>
               <div class="modal-body">
                 <div class="tab-content tab-content-in">
                   <div class="tab-pane active text-style" id="tab1">
                     <div class="inbox-right">
                         <div class="mailbox-content">
                            <div class="mail-toolbar clearfix">
                     			    <div class="float-right">
                                 <div class="dropdown">
                   			            <a href="#" title="" class="btn btn-default" data-toggle="dropdown" aria-expanded="false">
                   			                <i class="fa fa-cog icon_8"></i>
                   			                <i class="fa fa-chevron-down icon_8"></i>
                   			            <div class="ripple-wrapper"></div></a>
                   			            <ul class="dropdown-menu float-right">
                   			                <li>
                   			                    <a href="#" title="">
                   			                        <i class="fa fa-pencil-square-o icon_9"></i>
                   			                        Edit
                   			                    </a>
                   			                </li>
                   			                <li>
                   			                    <a href="#" class="font-red" title="">
                   			                        <i class="fa fa-times" icon_9=""></i>
                   			                        Delete
                   			                    </a>
                   			                </li>
                   			            </ul>
                   			        </div>
                                 <div class="btn-group">
                                     <a class="btn btn-default"><i class="fa fa-angle-left"></i></a>
                                     <a class="btn btn-default"><i class="fa fa-angle-right"></i></a>
                                 </div>
                 			         </div>

                             </div>
                             <table class="table">
                                       <tbody>
                                           <tr class="table-row">
                                               <td class="table-img">
                                                  <img src="images/in.jpg" alt="" />
                                               </td>
                                               <td class="table-text">
                                               	<h6> Lorem ipsum</h6>
                                                   <p>Nullam quis risus eget urna mollis ornare vel eu leo</p>
                                               </td>
                                               <td>
                                               	<span class="fam">Family</span>
                                               </td>
                                               <td class="march">
                                                  in 5 days
                                               </td>

                                                <td >
         							                            <i class="fa fa-remove icon-state-warning"></i>
                                               </td>
                                           </tr>
                                          <tr class="table-row">
                                               <td class="table-img">
                                                  <img src="images/in1.jpg" alt="" />
                                               </td>
                                               <td class="table-text">
                                               	<h6> Lorem ipsum</h6>
                                                   <p>Nullam quis risus eget urna mollis ornare vel eu leo</p>
                                               </td>
                                               <td>
                                               	<span class="mar">Market</span>
                                               </td>
                                               <td class="march">
                                                   in 5 days
                                               </td>

                                                <td >
                                                  <i class="fa fa-remove icon-state-warning"></i>
                                               </td>
                                           </tr>
                                       </tbody>
                                   </table>
                                  </div>
                               </div>
                            </div>
                 </div>
               </div>
               <div class="modal-footer">
                 <button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="fa fa-remove"></span> Cancel</button>
               </div>
             </div>
           </div>
         </div>
        </div>

 	      <!--content-->
 	      <div class="map-grid">
          <div class="map" id="map">

          </div>
        </div>
        <!--//content-->

        <!--SCRIPTS_OPENLAYERS-->
        <script src="<%= Configuration_jsp.URL_BASE_JS + "/ol.js" %>"></script>
        <script src="<%= Configuration_jsp.URL_BASE_JS + "/scripts_openLayer.js" %>"></script>
        <!--//SCRIPTS_OPENLAYERS-->

<%@include file="footer.jsp"%>
