<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- START Main section-->
      <section>
         
         <!-- START Page content-->
         <div class="main-content">        
               
<!--          	<button type="button" class="btn btn-oval btn-green pull-right"> -->
<!--          	<em class="fa fa-clock-o fa-fw mr-sm"></em>Histórico de serviços</button> -->
            
            <h3>Resumo da diarista
               <br>
               <small>Ver a frase mais tarde</small>              

            </h3>
            
            <div class="row">
               <!-- START dashboard main content-->
               <section class="col-md-13">
               
               	 
               	   <div ng-show="servicosList.length > 0" class="panel panel-default">
		               <div class="panel-heading">
							<div class="form-inline">
			                  		<small class="avGre"><em class="fa fa-circle"></em> TOTAL DE SOLICITAÇÕES. </small>
			                  		<small class="avReg"><em class="fa fa-circle"></em> PENDENTES. </small>
			                  		<small class="avSol"><em class="fa fa-circle"></em> ACEITOS. </small>
					                <small class="avNeg"><em class="fa fa-circle"></em> SERVIÇOS CANCELADOS. </small>
					                <small class="avPos"><em class="fa fa-circle"></em> TOTAL DE SERVIÇOS CONCLUÍDOS. </small>					                
			                 </div>					   
					   </div>
		               <div class="panel-body">
		                  <div class="form-inline">
		                  		
		                  		 <div class="col-lg-2">
				<!-- 	                  START widget -->
					                  <div class="panel widget">
					                     <div class="row row-table row-flush">
					                        <div class="col-xs-4 bg-green text-center">
					                           <em class="fa fa-share-square-o fa-2x"></em>
					                        </div>
					                        <div class="col-xs-8">
					                           <div class="panel-body text-center">
					                              <h4 class="mt0">{{countSolicitacoes}}</h4>
					                           </div>
					                        </div>
					                     </div>
					                  </div>
				<!-- 	                  END widget -->
					               </div>
					               
					               <div class="col-lg-2">
				<!-- 	                  START widget -->
					                  <div class="panel widget">
					                     <div class="row row-table row-flush">
					                        <div class="col-xs-4 bg-warning text-center">
					                           <em class="fa fa-exclamation-triangle fa-2x"></em>
					                        </div>
					                        <div class="col-xs-8">
					                           <div class="panel-body text-center">
					                              <h4 class="mt0">{{countServPendente}}</h4>
					                           </div>
					                        </div>
					                     </div>
					                  </div>
				<!-- 	                  END widget -->
					               </div>
					               
					               <div class="col-lg-2">
				<!-- 	                  START widget -->
					                  <div class="panel widget">
					                     <div class="row row-table row-flush">
					                        <div class="col-xs-4 bg-info text-center">
					                           <em class="fa fa-check fa-2x"></em>
					                        </div>
					                        <div class="col-xs-8">
					                           <div class="panel-body text-center">
					                              <h4 class="mt0">{{countServAceito}}</h4>
					                           </div>
					                        </div>
					                     </div>
					                  </div>
				<!-- 	                  END widget -->
					               </div>
					               
					               <div class="col-lg-2">
				<!-- 	                  START widget -->
					                  <div class="panel widget">
					                     <div class="row row-table row-flush">
					                        <div class="col-xs-4 bg-danger text-center">
					                           <em class="fa fa-times fa-2x"></em>
					                        </div>
					                        <div class="col-xs-8">
					                           <div class="panel-body text-center">
					                              <h4 class="mt0">{{countServCancel}}</h4>
					                           </div>
					                        </div>
					                     </div>
					                  </div>
				<!-- 	                  END widget -->
					               </div>
					               
					               <div class="col-md-2">
						               <div class="panel widget">
						                     <div class="row row-table row-flush">
						                        <div class="col-xs-4 bg-success text-center">
						                           <em class="fa fa-check fa-2x"></em>
						                        </div>
						                        <div class="col-xs-8">
						                           <div class="panel-body text-center">
						                              <h4 class="mt0">{{countServConcluido}}</h4>
						                           </div>
						                        </div>
						                     </div>
						                  </div>
						             </div> 
		                  		
		                  </div>
		               </div>
		            </div>
                  
                  
                  <div ng-show="servicosList.length > 0" class="panel panel-default">
		               <div class="panel-heading">
							<div class="form-inline">
			                  		Veja aqui suas avaliações de forma prática e objetiva				                
			                 </div>					   
					   </div>
		               <div class="panel-body">
		                  <div class="form-inline col-md-5">		                  		
		                  		<div>
									<div id="canvas-holder">
										<canvas id="chart-area">
										</canvas>
									</div>									
		                        </div>  
		                  </div>
		                  
		                 <div style="left:50px;" class="panel-body col-md-5">
	                        <div class="alert alert-success">Avaliações positivas.</div>           
	                        <div class="alert alert-warning">Avaliações regulares. </div>
	                        <div class="alert alert-danger">Avaliações ruins.</div>
	                     </div>
		                  
		               </div>        
		               
		            </div>
		            
		            <div class="alert alert-info" ng-show="servicosList.length == 0">
					      <h3>Não há dados suficiente para gerar o resumo<br>
						  </h3><h5>Em breve você poderá comparar os dados e graficos dos seus serviços.</h5>
									    
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
   
   <script src="<c:url value='/resources/assets/charts/Chart.js' />"></script>  
   
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
   
   <script src="<c:url value='/resources/assets/jloader/js/jquery.oLoader.min.js' />" ></script>
   
   <script src="<c:url value='/resources/rate/jquery.raty.js' />"></script>
   <!-- App Main-->
   <script src="<c:url value='/resources/assets/js/app.js' />"></script>
   <!-- END Scripts-->      

   <script src="<c:url value='/protected/controller/diaristaController.js' />"></script>   