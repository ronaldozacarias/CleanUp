<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div ng-controller="diaristaController">
    
<div class="main">
	
	<div class="main-inner">

	    <div class="container">
	
    	<div class="row">
    	<div class="span8 mainTitleNotification">
						
				<div class="widget widget-plain">
					
					<div class="widget-content">
						
						<h2>Selecione uma notificação para ser acessar os serviços.</h2>	
						
						
					</div> <!-- /widget-content -->
						
				</div> <!-- /widget -->
				
				
				
			</div> <!-- /span12 -->
         </div>	
    
	      <div class="row">
	      	
	      	<div class="span8 mainNotification">
	      		
	      		<div class="widget">
						
					<div class="widget-header">
						<i class="icon-warning-sign"></i>
						<h3>Todas notificações</h3>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
					
						<div class="accordion-group" ng-repeat="notificacao in note">
	                          <div class="accordion-heading">
	                          		<input type="hidden" value="{{notificacao.cliente.codigo}}" />
	                               	<a class="accordion-toggle" data-toggle="modal" data-target="#myModal2" 
	                               	   data-toggle="collapse" data-parent="#accordion2" href="#collapseOne" 
	                               	   ng-click="selectedCliente(notificacao.cliente);">
	                                    Cliente: {{notificacao.cliente.nome}}
	                                </a>
	                          </div>
	                          <div class="accordion-body collapse in">
	                                <div class="accordion-inner">
	                                   	{{notificacao.cliente.nome}} {{notificacao.descricaoNotificacao}} em 
	                                   	{{notificacao.dataEnvioNotificacao | date:'longDate'}}
	                                </div>
	                          </div>
	                     </div>					
						
					</div> <!-- /widget-content -->
						
				</div> <!-- /widget -->	
				
		    </div> <!-- /spa12 -->
		    
	      	
	      	
	      	
	      </div> <!-- /row -->
	
	    </div> <!-- /container -->
    
	</div> <!-- /main-inner -->
	
	
	
	<!-- MODAL -->

<div id="myModal2" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true" ng-click="reset()">×</button>
			<h3 id="myModalLabel">Serviços solicitados por {{cliente.nome}}</h3>
		</div>
		<form name="servicoForm" method="post">
			<div class="modal-body">
				<input type="hidden" required ng-model="notificacao.cliente.codigo" name="id"
					value="{{notificacao.cliente.codigo}}" />
					
					<table class="span6 tableservicos">
					<tr>
					
						<td>
						<div class="scroll-container">
						<div class="accordion-group" ng-repeat="servico in servicos">
	                          <div class="accordion-heading">
	                          		<input type="hidden" value="{{notificacao.cliente.codigo}}" />
	                               	<a class="accordion-toggle"
	                               	   data-toggle="collapse" data-parent="#accordion2">
	                                   Data: {{servico.dataServico | date:'longDate'}}
	                                </a>
	                          </div>
	                          <div class="accordion-body collapse in">
	                                <div class="accordion-inner">
	                                   	Endereço: {{servico.endereco.logradouro}} </br>
	                                   	Decrição: {{servico.descricao}} </br></br> 
	                                   	<button class="btn btn-primary" ng-click="addService(servico, $index);">Aceitar</button>
<!-- 	                                	<button class="btn btn-danger" ng-click="removeService($index)">Recusar</button>	                                 	 -->
	                                </div>	                                                                
	                          </div>
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
					<div id="map-canvas" class="span6"></div>
			</div>
			<div class="modal-footer">
				<div class="alert" ng-show="arrayEnd">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>Obrigatório!</strong>{{msg}}
				</div>
				<button type="submit" class="btn btn-primary"
					ng-click="enviarServicos(servicoForm)">Enviar</button>
			</div>
		</form>
	</div>

<!-- END MODAL -->
	
	
	
	    
</div> <!-- /main -->
    


<div class="extra">

	<div class="extra-inner">

		<div class="container">

			<div class="row">
                    <div class="span3">
                        <h4>
                            About Free Admin Template</h4>
                        <ul>
                            <li><a href="javascript:;">EGrappler.com</a></li>
                            <li><a href="javascript:;">Web Development Resources</a></li>
                            <li><a href="javascript:;">Responsive HTML5 Portfolio Templates</a></li>
                            <li><a href="javascript:;">Free Resources and Scripts</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Support</h4>
                        <ul>
                            <li><a href="javascript:;">Frequently Asked Questions</a></li>
                            <li><a href="javascript:;">Ask a Question</a></li>
                            <li><a href="javascript:;">Video Tutorial</a></li>
                            <li><a href="javascript:;">Feedback</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Something Legal</h4>
                        <ul>
                            <li><a href="javascript:;">Read License</a></li>
                            <li><a href="javascript:;">Terms of Use</a></li>
                            <li><a href="javascript:;">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Open Source jQuery Plugins</h4>
                        <ul>
                            <li><a href="http://www.egrappler.com">Open Source jQuery Plugins</a></li>
                            <li><a href="http://www.egrappler.com;">HTML5 Responsive Tempaltes</a></li>
                            <li><a href="http://www.egrappler.com;">Free Contact Form Plugin</a></li>
                            <li><a href="http://www.egrappler.com;">Flat UI PSD</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                </div> <!-- /row -->

		</div> <!-- /container -->

	</div> <!-- /extra-inner -->

</div> <!-- /extra -->    
    
<div class="footer">
	
	<div class="footer-inner">
		
		<div class="container">
			
			<div class="row">
				
    			<div class="span12">
    				&copy; 2013 <a href="http://www.egrappler.com/">Bootstrap Responsive Admin Template</a>.
    			</div> <!-- /span12 -->
    			
    		</div> <!-- /row -->
    		
		</div> <!-- /container -->
		
	</div> <!-- /footer-inner -->
	
</div> <!-- /footer -->

</div>

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- jQuery Version 1.11.0 -->
<%-- <script src="<c:url value='/resources/js/jquery.min.js' />"></script> --%>
<script
	src="<c:url value='/resources/js/js-template/excanvas.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/chart.min.js' />"></script>

<!-- Caixa de informação -->
<script src="<c:url value='/resources/js/js-template/infobox.js' />"></script>

<!-- Agrupamento dos marcadores -->
<script
	src="<c:url value='/resources/js/js-template/markerclusterer.js' />"></script>
<script src="<c:url value='/resources/js/jquery-1.7.2.min.js' />"></script>
<script src="<c:url value='/resources/js/jquery-ui.custom.mim.js' />"></script>
<script src="<c:url value='/resources/js/js-template/bootstrap.js' />"></script>
<script src="<c:url value='/resources/js/bootbox.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/signin.js' />"></script>
<script
	src="<c:url value='/resources/js/js-template/jquery.mask.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/jquery.mask.js' />"></script>
<script src="<c:url value='/resources/js/checklist-model.js' />"></script>

<script src="<c:url value='/protected/controller/diaristaController.js' />"></script>
