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
			                	
			                	<span>{{not.descricaoNotificacao}}.&nbsp&nbsp&nbsp</span><a href="" style="color: #fff" ng-click="selectedClienteNotification(not)"><span>Clique aqui para abrir o serviço</span></a> 
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
				                        <a href="javascript:void(0);"  title="" class="pull-right" data-original-title="Close Panel" ng-click="cancelarServicoModal(servico, $index)">
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
				                                   	<h2>Todos as operações foram concluidas</h2>	                                   	                               	
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
   
   <script src="<c:url value='/resources/assets/jloader/js/jquery.oLoader.min.js' />" ></script>
   
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