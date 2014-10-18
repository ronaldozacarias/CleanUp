<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="index.html">CleanUp Dashboard Diarista</a>
      <div class="nav-collapse">
        <ul class="nav pull-right">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-cog"></i> Conta <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="javascript:;">Configurações</a></li>
              <li><a href="javascript:;">Ajuda</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i> (Olá ${usuario.apelido}) <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="javascript:;">Perfil</a></li>
              <li><a href="<c:url value='/logout' />">Sair</a></li>
              
            </ul>
          </li>
        </ul>
<!--         <form class="navbar-search pull-right"> -->
<!--           <input type="text" class="search-query" placeholder="Search"> -->
<!--         </form> -->
      </div>
      <!--/.nav-collapse --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>
<!-- /navbar -->
    



    
<div class="subnavbar" ng-controller="diaristaController">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li class="active"><a href="home"><i class="icon-home"></i><span>Início</span> </a> </li>
        <li class="dropdown">
        	<a href="" class="dropdown-toggle" data-toggle="dropdown">
        		<i class="icon-warning-sign"><span class="badge badge-info" ng-show="notificacoes.length > 0">{{notificacoes.length}}</span></i>
        		<span>Notificações</span>
        	</a>        
	        <ul class="dropdown-menu notify" ng-show="notificacoes.length > 0">
	            <li  ng-repeat="notificacao in notificacoes">
	            	<a href="">{{notificacao.cliente.nome}} {{notificacao.descricaoNotificacao}}</a>
	            </li>	            
	        </ul>        
        </li>
        <li><a href=""><i class="icon-paste"></i><span>Planos</span> </a></li>
        <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-long-arrow-down"></i><span>Mais..</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="">Icons</a></li>
            <li><a href="">FAQ</a></li>
            <li><a href="">Pricing Plans</a></li>
            <li><a href="">Login</a></li>
            <li><a href="">Signup</a></li>
            <li><a href="">404</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>
    
    
<div class="main" ng-controller="diaristaController">
	
	<div class="main-inner">

	    <div class="container">
	
    	<div class="row">
    	<div class="span12">
						
				<div class="widget widget-plain">
					
					<div class="widget-content">
						
						<h2>Selecione uma notificação para ser redirecionado para serviço no qual ela esta vinculada.</h2>	
						
						
					</div> <!-- /widget-content -->
						
				</div> <!-- /widget -->
				
				
				
			</div> <!-- /span12 -->
         </div>	
    
	      <div class="row">
	      	
	      	<div class="span12">
	      		
	      		<div class="widget">
						
					<div class="widget-header">
						<i class="icon-warning-sign"></i>
						<h3>Todas notificações</h3>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
					
						<div class="accordion-group" ng-repeat="notificacao in notificacoes">
	                          <div class="accordion-heading">
	                               	<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
	                                    Cliente: {{notificacao.cliente.nome}}
	                                </a>
	                          </div>
	                          <div id="collapseOne" class="accordion-body collapse in">
	                                <div class="accordion-inner">
	                                   	{{notificacao.cliente.nome}} {{notificacao.descricaoNotificacao}} em 
	                                   	{{notificacao.dataEnvioNotificacao | date:'dd/MM/yyyy'}}
	                                </div>
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
<script src="<c:url value='/resources/js/checklist-model.js' />">

</script><script src="<c:url value='/protected/controller/diaristaController.js' />"></script>   
    <script src="<c:url value='/resources/js/bootbox.min.js' />"></script>