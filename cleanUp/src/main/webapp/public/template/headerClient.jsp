<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div ng-controller="clienteController">
	<div class="navbar navbar-fixed-top">
	  <div class="navbar-inner">
	    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
	                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="index.html">CleanUp</a>
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
	        <li class="active"><a href="/cleanUp/protected/home"><i class="icon-home"></i><span>Início</span> </a> </li>
	        <li class="dropdown">
	        	<a href="" class="dropdown-toggle" data-toggle="dropdown">
	        		<i class="icon-warning-sign"><span class="badge badge-info" ng-show="count > 0">{{count}}</span></i>
	        		<span>Notificações</span>
	        	</a>        
		        <ul class="dropdown-menu notify" ng-show="notificacoes.length > 0">
		            <li ng-repeat="notificacao in notificacoes">
		            
		            	<input type="hidden" value="{{notificacao.cliente.codigo}}" />
		            	<a data-toggle="modal" data-target="#myModal2" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne" 
		            	   ng-click="selectedCliente(notificacao.cliente);">
		            	    {{notificacao.descricaoNotificacao}} por {{notificacao.diarista.nome}}</a>	            	
		            </li>
		            <li>
		            	<a class="moreNotifications" href="/cleanUp/protected/cliente/notificacoesCliente">Mais notificações...</a>	            	
		            </li>	            
		        </ul>        
	        </li>        
	      </ul>
	    </div>
	    <!-- /container --> 
	  </div>
	  <!-- /subnavbar-inner --> 
	</div>
</div>


