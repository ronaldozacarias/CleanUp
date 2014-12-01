<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- START Main section-->
      <section>
           
         <!-- START Page content-->
         <div class="main-content">
         
<!--          	<button type="button" class="btn btn-oval btn-primary pull-right"> -->
<!--          	<em class="fa fa-question fa-fw mr-sm"></em>Help</button> -->
         	
            <h3><spring:message code="homePage" />
               <br>
               <small>Desfrute de toda comodidade que a CleanUp pode dispor</small>
            </h3>
            
            <div class="row">
               <!-- START dashboard main content-->
               <section class="col-md-13">
                      
			  		<div class="alert alert-info" ng-show="servicosAceitos.length == 0">
					      <h3>Você ainda não aceitou um serviço<br>
						  </h3><h5>Mas olha o que te aguarda logo abaixo.</h5>
									    
					</div>
			  		
					<div class="col-lg-4" ng-show="servicosAceitos.length == 0">
	                  <!-- START widget-->
	                  <div class="panel widget">
	                     <div class="row row-table row-flush">
	                        <div class="col-xs-5">
	                           <img src="<c:url value='/resources/assets/img/aceitos.png'  />" alt="" class="img-responsive"/>
	                        </div>
	                        <div class="col-xs-7 align-middle p-lg">
	                           <p>
	                              <strong>Serviços aceitos</strong>
	                           </p>
	                           <p>Nesta vão estar listados todos os serviços aceitos por você.</p>
	                        </div>
	                     </div>
	                  </div>
	                  <!-- END widget-->
	               </div>
	               
	               <div class="col-lg-4" ng-show="servicosAceitos.length == 0">
	                  <!-- START widget-->
	                  <div class="panel widget">
	                     <div class="row row-table row-flush">
	                        <div class="col-xs-5">
	                           <img src="<c:url value='/resources/assets/img/mapa.png'  />" alt="" class="img-responsive"/>
	                        </div>
	                        <div class="col-xs-7 align-middle p-lg">
	                           <p>
	                              <strong>Mapa</strong>
	                           </p>
	                           <p>Aqui é onde será exibido as rotas que estarão disponíves em Serviços aceitos.</p>
	                        </div>
	                     </div>
	                  </div>
	                  <!-- END widget-->
	               </div>
	               
	               <div class="col-lg-4" ng-show="servicosAceitos.length == 0">
	                  <!-- START widget-->
	                  <div class="panel widget">
	                     <div class="row row-table row-flush">
	                        <div class="col-xs-5">
	                           <img src="<c:url value='/resources/assets/img/trajeto.png'  />" alt="" class="img-responsive"/>
	                        </div>
	                        <div class="col-xs-7 align-middle p-lg">
	                           <p>
	                              <strong>Trajeto</strong>
	                           </p>
	                           <p>E para sua maior comodidade aqui será exibido o trajaeto da rota.</p>
	                        </div>
	                     </div>
	                  </div>
	                  <!-- END widget-->
	               </div>
	               
	               
               
	           <div class="row">	           		   	
		               <div class="col-lg-4 scrollServices" ng-show="servicosAceitos.length > 0">
		                  <div class="panel panel-default" ng-repeat="servico in servicosAceitos">		                  	  
                              <div class="panel-heading">
	                                 <h4 class="panel-title"><a class="">Data: &nbsp{{servico.dataServico | date:'dd/MM/yyyy'}}</a>
	                                 </h4>
	                              </div>
	                              <div class="panel-collapse collapse in" style="height: auto;">
	                                 <div class="panel-body">
	                                 	<ul class="list-unstyled">
		                                    <li class="mb-sm">
		                                       <em class="fa fa-map-marker fa-fw"></em>&nbspCliente: {{servico.cliente.nome}}</li>
		                                    
		                                    <li class="mb-sm">
		                                       <em class="fa fa-envelope fa-fw"></em>&nbspEndereço: {{servico.endereco.logradouro}}</li>
		                                 </ul>
		                                <div class="btn btn-oval btn-info pull-right" data-toggle="tooltip" data-placement="top" title="Traçar rota para trajeto de carro" ng-click="tracarRotaDeCarro(servico);">
					                       <input type="hidden" value="{{diarista.codigo}}" /><i class="fa fa-truck"></i>
									 	</div>
									 	<div class="btn btn-oval btn-success pull-right" data-toggle="tooltip" data-placement="top" title="Traçar rota para trajeto a pé" ng-click="tracarRotaDePe(servico);">
					                       <input type="hidden" value="{{diarista.codigo}}" /><i class="fa fa-male"></i>
									 	</div>
									 	<div class="btn btn-oval btn-warning pull-right" data-toggle="tooltip" data-placement="top" title="Traçar rota a partir do meu endereço" ng-click="meuEndereco(servico);">
					                       <input type="hidden" value="{{diarista.codigo}}" /><i class="fa fa-map-marker"></i></div>
					                    <div ng-show="enderecoGPS2 != ''" class="btn btn-oval btn-green pull-right" data-toggle="tooltip" data-placement="top" title="Traçar rota a partir da minha localização - padrão" ng-click="gps(servico);">
					                       <input type="hidden" value="{{diarista.codigo}}" /><i class="fa fa-globe"></i></div>
	                                 </div>	                                 
	                              </div>
	                       </div>
		               </div>
		               <div class="col-lg-5" ng-show="servicosAceitos.length > 0">
		                  <div class="panel panel-default">
		                     <div class="panel-heading">Últimos serviços aceitos</div>
		                     <div class="panel-body">
		                        <div id="map-canvas2"></div>
		                     </div>
		                  </div>
		               </div>
		               <div class="col-lg-3" ng-show="servicosAceitos.length > 0">
		                  <div class="well well-sm">
		                     <h4>Trajeto</h4>
		                     <div id="trajeto-texto"></div>
		                  </div>
		               </div>
		             </div>           
               
               </section>
               <!-- END dashboard main content-->
               
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
		      <div class="modal-dialog">
		         <div class="modal-content">
		            <div class="modal-header">
		               <button ng-click="reset()" type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
		               <div class="pull-left">
	                              <img src="/cleanUp/resources/assets/img/user/05.jpg" alt="Avatar" width="30" height="30" class="img-thumbnail img-circle">
	                           </div>
		               <h4 id="myMapModalLabel" class="modal-title">&nbsp Contactar {{diarista.nome}}</h4>
		            </div>
		            <form name="servicoForm" method="post">
		            <div class="modal-body">		               
		               <input type="hidden" required ng-model="diarista.codigo" name="id"
						value="{{diarista.codigo}}" />				

						<div class="modalBody">
							<div class="inputsCliente">
								<div class="form-group ">
								       	<label for="datePicker">Data do serviço</label>
								       	<div id="datePicker" data-pick-time="false" class="datetimepicker input-group date mb-lg">
					                    	<input id="dp" placeholder="dd/MM/yyyy" ng-model="data" type="text" class="form-control" required>
					                        <span class="input-group-addon">
					                        	<span class="fa-calendar fa"></span>
					                        </span>
					                	</div>		
								</div>		
								<div class="form-group">
										<label for="desc">Descrição do serviço, quantidade de
											cômodos e espaço físico.</label>
										<textarea ng-model="descricao" required class="form-control" rows="3"></textarea>
								</div>
								
								<div class="input-group">
	                                 <input id="txtEndereco" type="text" class="form-control" ng-model="logradouro" placeholder="Digite um endereço e confirme no botão (+)">
	                                 <span class="input-group-btn">
	                                    <button type="button" class="btn btn-success" ng-click="addEndereco()"><i class="fa fa-plus"></i></button>
	                                 </span>
                              	</div>
																									
									<div class="input-group" ng-show="enderecos.length > 0" ng-repeat="endereco in enderecos" class="item-unchecked">
		                                 <input disabled type="text" class="form-control" value="{{endereco.logradouro}}">
		                                 <span class="input-group-btn">
		                                    <button type="button" class="btn btn-danger" ng-click="removeEndereco($index)"><i class="fa fa-times"></i></button>
		                                 </span>
                              		</div>
		
								<div hidden id="mapa"></div>
		
								<input type="hidden" ng-model="lat" id="txtLatitude"
									name="txtLatitude" /> <input type="hidden" ng-model="lng"
									id="txtLongitude" name="txtLongitude" />
							</div>
						</div>
						
		            </div>
		            <div class="modal-footer">
			            <div class="alert" ng-show="arrayEnd">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<strong>Obrigatório!</strong>{{msg}}
						</div>
						<button type="submit" class="btn btn-primary"
							ng-click="enviarServico(servicoForm)">Enviar
						</button>
		            </div>		            
		            </form>
		         </div>
		      </div>
		   </div>		   
   <!-- END modal-->
   <!-- Main vendor Scripts-->
   <script src="<c:url value='/resources/assets/jquery/jquery.min.js' />"></script>
   <script src="<c:url value='/resources/js/js-template/jquery.mask.js' />"></script>
   <script src="<c:url value='/resources/assets/bootstrap/js/bootstrap.min.js' />"></script>
   <script src="<c:url value='/resources/js/jquery-ui.custom.mim.js' />"></script>
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
   
   <!-- BootstrapDatepicker-->
   <script src="<c:url value='/resources/assets/moment/min/moment-with-langs.min.js' />"></script>
   <script src="<c:url value='/resources/assets/datetimepicker/js/bootstrap-datetimepicker.min.js' />"></script>
   
   <script src="<c:url value='/resources/js/validacaoDeCamposCadastro.js' />"></script>
   
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
   
   <script src="<c:url value='/resources/assets/toast/toastr.js' />" ></script>
   
   <script src="<c:url value='/resources/assets/gmap/jquery.gmap.min.js' />"></script>
   <!-- App Main-->
   <script src="<c:url value='/resources/assets/js/app.js' />"></script>
   <!-- END Scripts-->     

   <script src="<c:url value='/protected/controller/diaristaController.js' />"></script> 