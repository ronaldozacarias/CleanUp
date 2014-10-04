<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- corrigindo -->
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="index.html">CleanUp Dashboard Cliente</a>
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
<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li class="active"><a href="/cleanUp/protected/home"><i class="icon-dashboard"></i><span>Dashboard</span> </a> </li>
        <li><a href=""><i class="icon-list-alt"><span class="badge badge-info">6</span></i><span>Notificações</span> </a> </li>
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
<!-- /subnavbar -->
<div class="main" ng-controller="clienteController">
  <div class="main-inner">
    <div class="container">

      <div class="row">
        <div class="span6">          
          <!-- /widget -->
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Diaristas</h3>
            </div>
            <!-- /widget-header -->
			<div class="widget-content">
              <ul class="news-items">              
                <li ng-repeat="diarista in diaristas">                  
                  <div class="news-item-date"> <a href="#" class="avatar"><img src="<c:url value='/resources/img/message_avatar1.png'  />"/></a></div>
                  <div class="news-item-detail"> <a href="http://www.egrappler.com/thursday-roundup-40/" class="news-item-title" target="_blank">{{diarista.nome}}</a>
                    <p class="news-item-preview"> <span>Avaliações positivas: </span>1231232</p>
                  	<p class="news-item-preview"> <span>Avaliações negativas: </span>123</p>
                    <p class="news-item-preview"> <span>telefone: </span>{{diarista.telefone}}</p>
                    <p class="news-item-preview"> <span>cidade: </span>{{diarista.cidade.nomeCidade}}</p>
                    <div class="news-item-preview" id="listaespecialidades">Especialidades:</div>
                    <div class="news-item-preview" id="listaespecialidades" ng-repeat="esp in diarista.especialidades">                    	
                    	<span>{{esp.nomeEspecialidade}}</span>
                    </div>                    	
                  </div>                  
                  <div class="news-item-date"> 
                  		<a href="javascript:;" class="btn btn-small btn-success" data-toggle="modal" data-target=".bs-example-modal-lg"><i class="btn-icon-only icon-ok"> </i></a>
                  		<span class="news-item-month">Selecionar</span>
                  </div>                                 
                </li>                
              </ul>
            </div>

			 <!-- BEGIN MODAL -->
            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only"></span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Contratar diarista</h4>
                    </div>
                    <div class="modal-body">
                        
						...

                    </div>                  
                </div>
              </div>
            </div>
            <!-- END MODAL -->

            <!-- /widget-content --> 
          </div>
        <!-- /widget --> 
        </div>
        <!-- /span6 -->
        <div class="span6">
          <div class="widget">
            <div class="widget-header"> <i class="icon-bookmark"></i>
              <h3>Funcionalidades</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="shortcuts"> <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-list-alt"></i><span
                                        class="shortcut-label">Apps</span> </a><a href="javascript:;" class="shortcut"><i
                                            class="shortcut-icon icon-bookmark"></i><span class="shortcut-label">Bookmarks</span> </a><a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-signal"></i> <span class="shortcut-label">Reports</span> </a><a href="javascript:;" class="shortcut"> <i class="shortcut-icon icon-comment"></i><span class="shortcut-label">Comments</span> </a><a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-user"></i><span
                                                class="shortcut-label">Users</span> </a><a href="javascript:;" class="shortcut"><i
                                                    class="shortcut-icon icon-file"></i><span class="shortcut-label">Notes</span> </a><a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-picture"></i> <span class="shortcut-label">Photos</span> </a><a href="javascript:;" class="shortcut"> <i class="shortcut-icon icon-tag"></i><span class="shortcut-label">Tags</span> </a> </div>
              <!-- /shortcuts --> 
            </div>
            <!-- /widget-content --> 
          </div>
                    
          <!-- /widget -->
        </div>
        <!-- /span6 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /main-inner --> 
</div>
<!-- /main -->
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
                </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /extra-inner --> 
</div>
<!-- /extra -->
<div class="footer">
  <div class="footer-inner">
    <div class="container">
      <div class="row">
        <div class="span12"> &copy; 2013 <a href="http://www.egrappler.com/">Bootstrap Responsive Admin Template</a>. </div>
        <!-- /span12 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /footer-inner --> 
</div>
<!-- /footer --> 
<!-- Le javascript
================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<!-- jQuery Version 1.11.0 -->    
<%-- <script src="<c:url value='/resources/js/jquery.min.js' />"></script> --%>
<script src="<c:url value='/resources/js/js-template/excanvas.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/chart.min.js' />"></script>
	
	<!-- Maps API Javascript -->
    <script src="<c:url value='http://maps.googleapis.com/maps/api/js?sensor=false' />"></script>
        
    <!-- Caixa de informação -->
    <script src="<c:url value='/resources/js/js-template/infobox.js' />"></script>
		
    <!-- Agrupamento dos marcadores -->
    <script src="<c:url value='/resources/js/js-template/markerclusterer.js' />"></script>
    
	    
    <script src="<c:url value='/resources/js/jquery-1.7.2.min.js' />"></script>
    <script src="<c:url value='/resources/js/js-template/bootstrap.js' />"></script>
    <script src="<c:url value='/resources/js/bootbox.min.js' />"></script>    
    <script src="<c:url value='/resources/js/js-template/signin.js' />"></script>
    <script src="<c:url value='/resources/js/js-template/jquery.mask.min.js' />"></script>
	<script src="<c:url value='/resources/js/js-template/jquery.mask.js' />"></script>
    <script src="<c:url value='/resources/js/checklist-model.js' />"></script>      
    <script src="<c:url value='/protected/controller/clienteController.js' />"></script> 
        <script src="<c:url value='/resources/js/validacaoDeCamposCadastro.js' />"></script> 