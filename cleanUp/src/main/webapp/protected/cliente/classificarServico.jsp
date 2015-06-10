<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div ng-controller="clienteController">
    
<div class="main">
	
	<div class="main-inner">

	    <div class="container">
	
    	<div class="row">
    	<div class="span8 mainTitleNotification">
						
				<div class="widget widget-plain">
					
					<div class="widget-content">
						
						<h2>Todos os serviços.</h2>	
						
						
					</div> <!-- /widget-content -->
						
				</div> <!-- /widget -->
				
				
				
			</div> <!-- /span12 -->
         </div>	
    
	      <div class="row">
	      	
	      	<div class="span8 mainNotification">
	      		
	      		<div class="widget">
						
					<div class="widget-header">
						<i class="icon-warning-sign"></i>
						<h3>Serviços</h3>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
						<div id="starclassification"></div> 
						<div class="accordion-group">
	                          <div class="accordion-heading">
	                               	<a class="accordion-toggle" data-toggle="modal" data-target="" 
	                               	   data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
	                                    Diarista: {{servico.diarista.nome}}
	                                </a>
	                          </div>
	                          <div class="accordion-body collapse in">
	                                <table style="width: 100%;">
	                                	<tr>
	                                		<td width="85%">
		                                		<div class="accordion-inner">
				                                   	Descrição do Serviço: {{servico.descricao}} </br>
				                                   	Data: {{servico.dataServico | date:'longDate'}} </br>
				                                   	Endereço: {{servico.endereco.logradouro}} </br>
				                                   	Status: {{servico.status}}
				                                </div>                                			
	                                		</td>
	                                	</tr>
	                                </table>
	                                
	                               
	                          </div>
	                     </div>					
						
					</div> <!-- /widget-content -->
						
				</div> <!-- /widget -->	
				
		    </div> <!-- /spa12 -->
		    
	      	
	      	
	      	
	      </div> <!-- /row -->
	
	    </div> <!-- /container -->
    
	</div> <!-- /main-inner -->
		    
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

<script src="<c:url value='/resources/js/elif.js' />"></script>

<!-- Caixa de informação -->
<script src="<c:url value='/resources/js/js-template/infobox.js' />"></script>

<!-- Agrupamento dos marcadores -->
<script
	src="<c:url value='/resources/js/js-template/markerclusterer.js' />"></script>

<script src="<c:url value='/resources/js/js-template/bootstrap.js' />"></script>
<script src="<c:url value='/resources/js/bootbox.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/signin.js' />"></script>
<script
	src="<c:url value='/resources/js/js-template/jquery.mask.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/jquery.mask.js' />"></script>
<script src="<c:url value='/resources/js/checklist-model.js' />"></script>
<script src="<c:url value='/resources/rate/jquery.raty.js' />"></script>
<script src="<c:url value='/protected/controller/clienteController.js' />"></script>
