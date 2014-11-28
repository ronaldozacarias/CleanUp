<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- START Main section-->
      <section ng-controller="diaristaController">
         
         <!-- START Page content-->
         <div class="main-content">        
               
         	<h3>Todas as notificações
               <br>
               <small>referentes a serviços solicitados por você</small>
            </h3>
            
            <div class="row">
               <!-- START dashboard main content-->
               <section>
               
               	  <!-- START Page content-->
	         	  <div class="main-content col-md-13">
	         	  
		         	  <div class="alert alert-info" ng-show="notificacoes.length == 0">
		              		<h3>Não há notificações<br>
							     <h5>Você não recebeu nenhuma notificação no momento.</h5>
						    </h3>
		              </div> 
	               		
	                  <div ng-show="notificacoes.length > 0" class="alert alert-info alert-dismissable" ng-repeat="not in notificacoes">
			                	<button type="button" aria-hidden="true" class="close" ng-click="setarComoVizualizada(not)">×</button>
			                	<span>{{not.descricaoNotificacao}}</span> 
			                	<span class="pull-right">Data de envio: {{not.dataEnvioNotificacao | date:'dd/MM/yyyy - HH:mm'}}</span> 
<!-- 			                	<a href="javascript:void(0);" class="alert-link">Alert Link</a>. -->
			          </div>
				   
				  </div>               
               
               </section>
               
            </div>
         </div>
         <!-- END Page content-->
         <!-- START Page footer-->
         <footer>&copy; 2014 - Wintermin</footer>
         <!-- END Page Footer-->
      </section>
      <!-- END Main section-->     
   

   <!-- Main vendor Scripts-->
   <script src="<c:url value='/resources/assets/jquery/jquery.min.js' />"></script>
   <script src="<c:url value='/resources/assets/bootstrap/js/bootstrap.min.js' />"></script>
   <script src="<c:url value='/resources/js/bootbox.min.js' />"></script>
   
   <!-- Plugins-->
   <script src="<c:url value='/resources/assets/chosen/chosen.jquery.min.js' />"></script>
   <script src="<c:url value='/resources/assets/slider/js/bootstrap-slider.js' />"></script>
   <script src="<c:url value='/resources/assets/filestyle/bootstrap-filestyle.min.js' />"></script>
   
   
   <!-- Animo-->
   <script src="<c:url value='/resources/assets/animo/animo.min.js' />"></script>
   
   <!-- Sparklines-->
   <script src="<c:url value='/resources/assets/sparklines/jquery.sparkline.min.js' />"></script>
   
   <!-- Slimscroll-->
   <script src="<c:url value='/resources/assets/slimscroll/jquery.slimscroll.min.js' />"></script>
   
   <!-- Store + JSON-->
   <script src="<c:url value='/resources/assets/store/store+json2.min.js' />"></script>
   
   <!-- Classyloader-->
   <script src="<c:url value='/resources/assets/classyloader/js/jquery.classyloader.min.js' />"></script>
   
   <!-- START Page Custom Script-->
   <!--  Flot Charts-->
   <script src="<c:url value='/resources/assets/flot/jquery.flot.min.js' />"></script>
   <script src="<c:url value='/resources/assets/flot/jquery.flot.tooltip.min.js' />"></script>
   <script src="<c:url value='/resources/assets/flot/jquery.flot.resize.min.js' />"></script>
   <script src="<c:url value='/resources/assets/flot/jquery.flot.pie.min.js' />"></script>
   <script src="<c:url value='/resources/assets/flot/jquery.flot.time.min.js' />"></script>
   <script src="<c:url value='/resources/assets/flot/jquery.flot.categories.min.js' />"></script>
   <!--[if lt IE 8]><script src="js/excanvas.min.js"></script><![endif]-->
   <!-- END Page Custom Script-->
   
   <script src="<c:url value='/resources/rate/jquery.raty.js' />"></script>
   <!-- App Main-->
   <script src="<c:url value='/resources/assets/js/app.js' />"></script>
   <!-- END Scripts-->      

   <script src="<c:url value='/protected/controller/diaristaController.js' />"></script>   