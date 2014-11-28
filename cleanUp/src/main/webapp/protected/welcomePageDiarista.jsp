<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- START Main section-->
      <section>
           
         <!-- START Page content-->
         <div class="main-content">
         
         	<button type="button" class="btn btn-oval btn-primary pull-right">
         	<em class="fa fa-question fa-fw mr-sm"></em>Help</button>
         	
            <h3><spring:message code="homePage" />
               <br>
               <small><spring:message code="homePageSmall" /></small>
            </h3>
            
            <div class="row">
               <!-- START dashboard main content-->
               <section class="col-md-13">
               
	           <div class="col-md-6">
                  <div class="panel panel-default">
                     <div class="panel-heading">Classic Map</div>
                     <div class="panel-body">
                        <div></div>
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
   
   <script src="<c:url value='/resources/assets/gmap/jquery.gmap.min.js' />"></script>
   <!-- App Main-->
   <script src="<c:url value='/resources/assets/js/app.js' />"></script>
   <!-- END Scripts-->      

   <script src="<c:url value='/protected/controller/diaristaController.js' />"></script> 