<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- START Main section-->
      <section ng-controller="clienteController">
         
         <!-- START Page content-->
         <div class="main-content">        
               
         	
         	<a style="text-decoration: none; color:#fff" href="/cleanUp/protected/cliente/historicoServicosCliente">
         	<button type="button" class="btn btn-oval btn-green pull-right">
         	
         	<em class="fa fa-clock-o fa-fw mr-sm"></em>Histórico de serviços</button></a>
            
            <h3><spring:message code="service.client" />
               <br>
               <small>Realizadas por você</small>              

            </h3>
            
            <div class="row">
               <!-- START dashboard main content-->
               <section class="col-md-13">
               
               	  <!-- START Page content-->
	         <div class="main-content">
	         	  
	         	  <div class="alert alert-info" ng-show="servicosList.length == 0">
	              		<h3>Não há serviços<br>
						     <h5>Você não realizou nenhuma solicitação de serviço</h5>
					    </h3>
	              </div> 
               		
                  <div ng-show="showServicos">
                    	               
	               <div class="col-lg-13 searchDiarist" ng-show="servicoList.length > 0">
	               	   <em class="fa fa-search sd"></em>
		               <div class="form-group has-feedback">
		                     <input ng-model="searchService" ng-change="filter()" id="exampleInputPassword1" type="text" placeholder="Digite o termo da busca" class="form-control">
		               </div>
	               </div>
	               
	               <div class="panel widget col-lg-12" ng-repeat="servico in filtered = (servicosList | filter:searchService) | startFrom:(currentPage-1)*entryLimit | limitTo:entryLimit">
		               <div class="panel-body listDiarista">
		               			<input type="hidden" value="{{servico.codigo}}" />
		                        <div class="media mt0">
		                           <div class="pull-left">
		                              <img src="/cleanUp/resources/assets/img/user/05.jpg" alt="Avatar" width="60" height="60" class="img-thumbnail img-circle">
		                           </div>
		                           <div class="media-body">
		                              <div class="media-heading masterdiarista">
		                                 <h3 class="mt0 ng-binding"> Cliente: {{servico.diarista.nome}}</h3>
		                                 <ul class="list-unstyled">
		                                    <li class="mb-sm ng-binding">
		                                       <em class="fa fa-list fa-fw"></em> Descrição do Serviço: {{servico.descricao}}</li>
		                                    
		                                    <li class="mb-sm ng-binding">
		                                       <em class="fa fa-calendar fa-fw"></em> Data: {{servico.dataServico | date:'longDate'}}</li>
		                                    <li class="mb-sm ng-binding">
		                                       <em class="fa fa-map-marker fa-fw"></em> Endereço: {{servico.endereco.logradouro}}</li>
		                                 </ul>
		                              </div>
		                           	  
		                           	   <div class="media-heading masterdiarista">
		                                 <ul class="list-unstyled">
		                                 	<li class="mb-sm ng-binding">
		                                       <em class="fa fa-info fa-fw"></em> Status: {{servico.status}}</li>	                                    	
		                                 </ul>
		                                 <div ng-if="servico.status != 'CANCELAR' && servico.status != 'CONCLUIDO' " class="btn btn-oval btn-danger pull-right" ng-click="cancelarServico(servico)">
		                                 	<input type="hidden" value="{{servico.codigo}}" />
												<i class="fa fa-times"></i>
										 </div>
		                                 <div ng-show="servico.status == 'ACEITO'" class="btn btn-oval btn-warning pull-right" ng-click="selectedServicoAlaviacao(servico);">
		                                 	<input type="hidden" value="{{diarista.codigo}}" />
												<i class="fa fa-star"></i>
										 </div>
										 
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
				   
				   <div class="col-lg-13" ng-show="showAvaliacao">
	                  <!-- START widget-->
	                  <div class="panel widget">
		                 <div class="panel-body bg-inverse">
		                        <div class="row row-table text-center">
		                           <div class="col-xs-6">
		                              <p class="m0 h3">Avalie o serviço prestado por</p>
		                           </div>		                           
		                        </div>
	                     </div>
	                     <div class="panel-body">
	                        <div class="media p mt0">
	                           <div class="pull-left">
	                              <img src="<c:url value='/resources/assets/img/user/05.jpg'  />" alt="Avatar" width="60" height="60" class="img-thumbnail img-circle"/>
	                           </div>
	                           <div class="media-body">
	                              <div class="media-heading masterdiarista">
	                                 <h3 class="mt0"> {{servico.diarista.nome}}</h3>
	                                 <ul class="list-unstyled">
	                                    <li class="mb-sm">
	                                       <em class="fa fa-list fa-fw"></em> {{servico.descricao}}</li>
	                                    <li class="mb-sm">
	                                       <em class="fa fa-calendar fa-fw"></em> {{servico.dataServico | date:'longDate'}}</li>
	                                    <li class="mb-sm">
	                                       <em class="fa fa-map-marker fa-fw"></em> {{servico.endereco.logradouro}}</li>	                                       
	                                       
	                                 </ul>
	                              </div>
	                           	  <div class="media-heading">
	                           	  <div class="col-md-4">
	                                 <div id="starclassification"></div>
	                                 <label for="desc">Deixe um comentário.</label>									 
										 <textarea id="comentario" ng-model="comentario" required class="form-control" rows="3"></textarea>
	                                 </div>                           
	                              </div>
	                              <div class="media-heading">
	                              		<div style="width:101px;" class="mb-sm btn btn-oval btn-primary" ng-click="salvarClassificacao(servico)">
												<i class="fa fa-check"></i>Salvar
										 </div>
	                              		<div style="width:101px;" class="mb-sm btn btn-oval btn-danger" ng-click="cancelarClassificacao()">
												<i class="fa fa-times"></i>Cancelar
										 </div>		                                 
	                              </div>
	                           </div>
	                        </div>
	                     </div>
	                     
	                  </div>
	                  <!-- END widget-->
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
   <script src="<c:url value='/resources/js/elif.js' />"></script>
   
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

   <script src="<c:url value='/protected/controller/clienteController.js' />"></script>   