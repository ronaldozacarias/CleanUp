<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- START Main section-->
      <section>
         
         <!-- START Page content-->
         <div class="main-content">        
               
         	<button type="button" class="btn btn-oval btn-green pull-right">
         	<em class="fa fa-clock-o fa-fw mr-sm"></em>Histórico de serviços</button>
            
            <h3><spring:message code="service.client" />
               <br>
               <small>Realizadas por você</small>              

            </h3>
            
            <div class="col-lg-13 searchDiarist">
	               	   <em class="fa fa-search sd"></em>
		               <div class="form-group has-feedback">
		                     <input ng-model="searchService" ng-change="filter()" id="exampleInputPassword1" type="text" placeholder="Digite o termo da busca" class="form-control">
		               </div>
	        </div>
            
            <div class="row">
               <!-- START dashboard main content-->
               <section class="col-md-13">
                  <div>
                    
                    <div class="col-lg-13">
	                  <!-- START panel-->
	                  <div class="panel panel-default">
	                     <div class="panel-heading">Form Wizard Vertical (no validation)</div>
	                     <div class="panel-body">
	                        
	                        <div class="panel widget col-lg-12" ng-repeat="servico in filtered = (servicosList | filter:searchService) | startFrom:(currentPage-1)*entryLimit | limitTo:entryLimit">
				               <div class="panel-body">
				               			<input type="hidden" value="{{servico.codigo}}" />
				                        <div class="media mt0">

											<div ng-show="servico.status != 'CONCLUIDO'" class="btn btn-oval btn-danger pull-right" ng-click="cancelarServico(servico)">
				                                 	<input type="hidden" value="{{servico.codigo}}" />
														<i class="fa fa-times"></i>
												 </div>
				                                 <div ng-show="servico.status == 'PENDENTE'" class="btn btn-oval btn-success pull-right" ng-click="selectedCliente(servico.cliente);">
				                                 	<input type="hidden" value="{{diarista.codigo}}" />
														<i class="fa fa-check"></i>
												 </div>				                           

				                           <div class="media-body">
				                              <div class="media-heading">
				                                 <h4 class="mt0 ng-binding"> Cliente: {{servico.cliente.nome}}</h4>
				                                 <ul class="list-unstyled">
				                                    <li class="mb-sm ng-binding">
				                                       <em class="fa fa-calendar fa-fw"></em> Data: {{servico.dataServico | date:'longDate'}}</li>
				                                    <li class="mb-sm ng-binding">
				                                       <em class="fa fa-map-marker fa-fw"></em> Endereço: {{servico.endereco.logradouro}}</li>
				                                 	<li class="mb-sm ng-binding">
				                                       <em class="fa fa-info fa-fw"></em> Status: {{servico.status}}</li>
				                                 </ul>
				                              </div>
				                           </div>
				                        </div>
				                 </div>
			               </div>
			               
			               <div class="col-md-12" ng-show="filteredItems > 3">    
						            <pagination class="pagination" page="currentPage" on-select-page="setPage(page)" total-items="filteredItems" 
									items-per-page="entryLimit" ng-model="currentPage" ng-change="pageChanged(currentPage)" 
									max-size="maxSize" class="pagination-sm" boundary-links="true" rotate="false" num-pages="numPages"></pagination>
						   </div>
	                        
	                     </div>
	                  </div>
	                  <!-- END panel -->
	               </div>
                    
                    
<!--                     <div class="col-lg-4"> -->
<!-- 	                  START widget -->
<!-- 	                  <div class="panel widget"> -->
<!-- 	                     <div class="row row-table row-flush"> -->
<!-- 	                        <div class="col-xs-4 bg-info text-center"> -->
<!-- 	                           <em class="fa fa-share-square-o fa-2x"></em> -->
<!-- 	                        </div> -->
<!-- 	                        <div class="col-xs-8"> -->
<!-- 	                           <div class="panel-body text-center"> -->
<!-- 	                              <h4 class="mt0">{{servicosList.length}}</h4> -->
<!-- 	                              <p class="mb0 text-muted">SOLICITAÇÕES</p> -->
<!-- 	                           </div> -->
<!-- 	                        </div> -->
<!-- 	                     </div> -->
<!-- 	                  </div> -->
<!-- 	                  END widget -->
<!-- 	               </div> -->
	               
<!-- 	               <div class="col-lg-4"> -->
<!-- 	                  START widget -->
<!-- 	                  <div class="panel widget"> -->
<!-- 	                     <div class="row row-table row-flush"> -->
<!-- 	                        <div class="col-xs-4 bg-warning text-center"> -->
<!-- 	                           <em class="fa fa-exclamation-triangle fa-2x"></em> -->
<!-- 	                        </div> -->
<!-- 	                        <div class="col-xs-8"> -->
<!-- 	                           <div class="panel-body text-center"> -->
<!-- 	                              <h4 class="mt0">{{countServPendente}}</h4> -->
<!-- 	                              <p class="mb0 text-muted">PENDENTES</p> -->
<!-- 	                           </div> -->
<!-- 	                        </div> -->
<!-- 	                     </div> -->
<!-- 	                  </div> -->
<!-- 	                  END widget -->
<!-- 	               </div> -->
	               
<!-- 	               <div class="col-lg-4"> -->
<!-- 	                  START widget -->
<!-- 	                  <div class="panel widget"> -->
<!-- 	                     <div class="row row-table row-flush"> -->
<!-- 	                        <div class="col-xs-4 bg-danger text-center"> -->
<!-- 	                           <em class="fa fa-times fa-2x"></em> -->
<!-- 	                        </div> -->
<!-- 	                        <div class="col-xs-8"> -->
<!-- 	                           <div class="panel-body text-center"> -->
<!-- 	                              <h4 class="mt0">{{countServCancel}}</h4> -->
<!-- 	                              <p class="mb0 text-muted">CANCELADOS</p> -->
<!-- 	                           </div> -->
<!-- 	                        </div> -->
<!-- 	                     </div> -->
<!-- 	                  </div> -->
<!-- 	                  END widget -->
<!-- 	               </div>                           -->
	               
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
   
   	  <!-- START modal-->
		<div id="myModal" tabindex="-1" role="dialog" aria-labelledby="myMapModalLabel" aria-hidden="true" class="modal fade">
		      <div class="modal-dialog modal-lg">
		         <div class="modal-content">
		            <div class="modal-header">
		               <button ng-click="reset()" type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
		               <h4 id="myMapModalLabel" class="modal-title">&nbsp Serviços solicitados por {{cliente.nome}}</h4>
		            </div>
		            <form name="servicoForm" method="post">
		            <div class="modal-body">		               
		               <input type="hidden" required ng-model="servico.codigo" name="id"
						value="{{servico.codigo}}" />				

						<table class="col-lg-7 maxHeigth">
							<tr>
							
								<td>
								<div class="scroll-container">
								
								<div class="col-lg-13" ng-repeat="servico in servicos">
				                  <!-- START panel-->
				                  <div class="panel panel-default">
				                     <div class="panel-heading"><em class="fa fa-calendar fa-fw"></em>Data: {{servico.dataServico | date:'longDate'}}
				                        <a href="javascript:void(0);"  title="" class="pull-right" data-original-title="Close Panel" ng-click="cancelarServico(servico)">
				                           <em class="fa fa-times"></em>
				                        </a>
				                     </div>
				                     <div class="panel-body">
				                     
				                     	<ul class="list-unstyled">					                        
					                        <li class="mb-sm ng-binding"><em class="fa fa-map-marker fa-fw"></em> Endereço: {{servico.endereco.logradouro}}</li>
					                       	<li class="mb-sm ng-binding"><em class="fa fa-info fa-fw"></em> Decrição: {{servico.descricao}}</li>
					                    </ul>
				                        <button type="button" class="btn btn-oval btn-success" ng-click="addService(servico, $index);">Aceitar</button>
				                     </div>
				                  </div>
				                  <!-- END panel-->
				               </div>
																
				                   <div ng-show="servicos.length == 0">
				                          <div class="alert alert-success">
				                                <div class="accordion-inner">
				                                   	<h2>Todos os serviços foram aceitos</h2>	                                   	                               	
				                                </div>	                                                                                                
				                          </div>
				                          
				                          <div id="imagem">
				                                <img src="<c:url value='/resources/img/confirm2.fw.png'  />" class="imagem" alt=""/>	                                   	                               	
				                           </div>	
				                   </div>
			                  </div>
			                 </td>	                     
			                 </tr>					
							</table>
							
							<div id="map-canvas"></div>
							
						
		            </div>
		            <div class="modal-footer">
						<button type="submit" class="btn btn-primary"
							ng-click="enviarServicos(servicoForm);">Enviar
						</button>
		            </div>		            
		            </form>
		         </div>
		      </div>
		   </div>		   
   <!-- END modal-->

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