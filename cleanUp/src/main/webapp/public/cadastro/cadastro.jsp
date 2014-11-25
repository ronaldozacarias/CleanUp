<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="row row-table page-wrapper" ng-controller="cadastroController">

	  <div data-toggle="notify" data-onload data-message="&lt;b&gt;Welcome Visitor!&lt;/b&gt; Dismiss this message with a click or wait for it to disappear." data-options="{&quot;status&quot;:&quot;danger&quot;, &quot;pos&quot;:&quot;top-right&quot;}"
            class="hidden-xs"></div>
	  
      <div class="col-lg-4 col-md-6 col-sm-8 col-xs-12 align-middle">
         <!-- START panel-->
         <div data-toggle="play-animation" data-play="fadeIn" data-offset="0" class="panel panel-dark panel-flat">
            <div class="panel-heading text-center mb-lg">
               <a href="#">
                  <img src="<c:url value='/resources/assets/img/logo.png'  />" alt="Image" class="block-center img-rounded"/>
               </a>
               <p class="text-center mt-lg">
                  <strong>SIGNUP TO GET INSTANT ACCESS.</strong>
               </p>
            </div>
            <div class="panel-body">
               <form name="newPeopleForm">
               	  
               	  <div class="clearfix">
                     <div class="checkbox c-checkbox pull-left mt0">
                        <label>
                           <input ng-model="mostrar" type="checkbox" value="">
                           <span class="fa fa-check"></span>Sou diarista
                        </label>
                     </div>
                  </div>
               	  
                  <div class="form-group has-feedback">
                     <input id="signupInputEmail1" type="text" placeholder="Nome" class="form-control" ng-model="pessoa.nome" required="required" pattern=".{4,}">
                     <span class="fa fa-user form-control-feedback text-muted"></span>
                  </div>
                  <div class="form-group has-feedback">
                     <input id="cpf" type="text" placeholder="CPF" class="form-control" ng-model="pessoa.cpf" required="required" pattern=".{11,}" maxlength="11">
                     <span class="fa fa-credit-card form-control-feedback text-muted"></span>
                  </div>
                  <div class="form-group has-feedback">
                     <input id="tel" type="text" placeholder="Telefone" class="form-control" ng-model="pessoa.telefone" required="required" pattern=".{10,}" maxlength="10">
                     <span class="fa fa-phone form-control-feedback text-muted"></span>
                  </div>
                  <div class="form-group has-feedback">
                     <input id="signupInputRePassword1" type="text" placeholder="Cidade" class="form-control" ng-model="selected" required="required" typeahead="cidade as cidade.nomeCidade for cidade in cidades | filter:$viewValue | limitTo:8">
<!--                      <input type="text" ng-model="selected" placeholder="Digite sua Cidade" typeahead="cidade as cidade.nomeCidade for cidade in cidades | filter:$viewValue | limitTo:8" class="login"> -->
                     <span class="fa fa-globe form-control-feedback text-muted"></span>
                  </div>
                  <div ng-show="mostrar" class="form-group has-feedback">
                     <input id="signupInputRePassword1" type="text" placeholder="Endereço" class="form-control" ng-model="pessoa.endereco" required="required" pattern=".{4,}">
                     <span class="fa fa-map-marker form-control-feedback text-muted"></span>
                  </div>                 
                  
<!-- 				<select ng-model="bla" ng-options="esp.codigoEspecialidade as esp.nomeEspecialidade for esp in especialidades" class="chosen-select input-md form-control"> -->
<!-- 				</select>				 -->
				                  
                  <div class="form-group has-feedback">
                     <input ng-model="pessoa.email" id="signupInputRePassword1" type="text" placeholder="Email" class="form-control" ng-model="pessoa.email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>
                     <span class="fa fa-envelope form-control-feedback text-muted"></span>
                  </div>
                  <div class="form-group has-feedback">
                     <input ng-model="pessoa.senha" id="signupInputRePassword1" type="password" placeholder="Senha" class="form-control" pattern=".{8,}" maxlength="14" required>
                     <span class="fa fa-lock form-control-feedback text-muted"></span>
                  </div>
                  
                  <div ng-show="mostrar" class="form-group has-feedback">
                     <label for="check" class="text-muted">Especialidades</label>
                     <div class="form-group has-feedback">
	                     <div class="clearfix col-md-4 zindex" ng-repeat="especialidade in especialidades" >
		                     <div class="checkbox c-checkbox pull-left mt0">
		                        <label>
		                           <input type="checkbox" checklist-model="especialidadesDiarista" checklist-value="especialidade.codigoEspecialidade"/></td>
		                           <span class="fa fa-check"></span>{{especialidade.nomeEspecialidade}}
		                        </label>
		                     </div>
		                  </div>
	                  </div>	                 
                  </div>              
                  
                  <div class="clearfix">
                     <div class="checkbox c-checkbox pull-left mt0">
                        <label>
                           <input ng-model="termos" type="checkbox" value="First Choice">
                           <span class="fa fa-check"></span>Eu aceito os <a href="#">termos</a> e condições de uso 
                        </label>
                     </div>
                  </div>
                  
                  <button type="submit" class="btn btn-block btn-success" ng-click="createPeople(newPeopleForm)">Cadastrar</button>
               </form>
            </div>
         </div>
         <!-- END panel-->
      </div>
   </div>
   <!-- END wrapper-->
	
	
   <script src="<c:url value='/resources/assets/jquery/jquery.min.js' />"></script>
   <script src="<c:url value='/resources/assets/bootstrap/js/bootstrap.min.js' />"></script>
   <script src="<c:url value='/resources/js/checklist-model.js' />"></script>
   <script src="<c:url value='/resources/js/bootbox.min.js' />"></script>
   
   <script src="<c:url value='/resources/assets/animo/animo.min.js' />"></script>
   <script src="<c:url value='/resources/assets/js/pages.js' />"></script>
   <script src="<c:url value='/resources/js/js-template/jquery.mask.min.js' />"></script>
	<script src="<c:url value='/resources/js/js-template/jquery.mask.js' />"></script>
   <script src="<c:url value='/resources/js/validacaoDeCamposCadastro.js' />"></script>
   <script src="<c:url value='/resources/js/util.js' />"></script>

   <script src="<c:url value='/public/controller/cadastroController.js' />"></script>
    