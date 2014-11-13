<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			
			<a class="brand" href="/cleanUp/">
				<img id="logoBarra" src="<c:url value='/resources/img/CleanUp2.png'  />" title="logo"/>			
			</a>		
			
			<div class="nav-collapse">
				<ul class="nav pull-right">
					<li class="">						
						<a href="/cleanUp/login" class="">
							Você já tem uma conta? Entre agora
						</a>
						
					</li>
					<li class="">						
						<a href="/cleanUp/" class="">
							<i class="icon-chevron-left"></i>
							Voltar para Página inicial
						</a>
						
					</li>
				</ul>
				
			</div><!--/.nav-collapse -->	
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->



<div class="account-container register" ng-controller="cadastroController">
	
	<div class="content clearfix">
	
<!-- 				<div ng-show="returnMessageSuccess" class="alert alert-success"> -->
<!--                      <button type="button" class="close" data-dismiss="alert">×</button> -->
<!--                      <strong>{{message}}</strong> -->
<!--                 </div> -->
                
<!--                 <div ng-show="returnMessageError" class="alert"> -->
<!--                      <button type="button" class="close" data-dismiss="alert">×</button> -->
<!--                      <strong>{{message}}</strong> -->
<!--                 </div> -->
		
		<form name="newPeopleForm">
		
			<h1>Cadastre-se agora!</h1>			
			
			<div class="login-fields">
				
				<p>Crie sua conta gratuitamente:</p>
				<span class="soudiarista-checkbox">
					<input ng-model="mostrar" id="Field2" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
					<label class="choice" for="Field">Sou diarista</label>
				</span>
				
				<div class="field">
					<label for="firstname">Primeiro nome:</label>
					<input ng-model="pessoa.nome" type="text" id="firstname" name="firstname" value="" placeholder="Primeiro nome" pattern=".{4,}" class="login" required/>
				</div> <!-- /field -->
				
				<div class="field">
					<label for="cpf">CPF:</label>	
					<input ng-model="pessoa.cpf" type="text" id="cpf" name="cpf" value="" placeholder="Seu CPF (Somente números)" class="login" required="required" name="numbers" pattern=".{11,}" maxlength="11"/>
				</div> <!-- /field -->
				
				<div class="field">
					<label for="tel">Telefone:</label>	
					<input ng-model="pessoa.telefone" type="text" id="tel" name="tel" value="" placeholder="Seu Telefone (Somente números)" class="login" required="required" pattern=".{10,}" maxlength="10" name="numbers" />
				</div> <!-- /field -->			
				
				<div class="field">
					<label for="select">Cidade:</label>
<!-- 					<pre>Model: {{selected | json}}</pre> -->
					<input type="text" ng-model="selected" placeholder="Digite sua Cidade" typeahead="cidade as cidade.nomeCidade for cidade in cidades | filter:$viewValue | limitTo:8" class="login">
					
<!-- 					<select ng-model="pessoa.cidade" id="select" name="select" class="login" required> -->
<!-- 					  <option value="" disabled selected>Sua Cidade</option> -->
<!-- 					  <option ng-repeat="cidade in cidades" value={{cidade.codigoCidade}}>{{cidade.nomeCidade}}</option> -->
<!-- 					</select> -->
					
					
				</div> <!-- /field -->
				<div  ng-show="mostrar">
				
				<div class="field">
					<label for="endereco">Endereço:</label>
					<input ng-model="pessoa.endereco" type="text" id="firstname" name="endereco" value="" placeholder="Exp: logradouro, numero - bairro" class="login" pattern=".{6,150}"  required/>
				</div> <!-- /field -->
				
				<p>Especialidades:</p>
				
				<table>
				  <tr ng-repeat="especialidade in especialidades">
				    <td>{{especialidade.nomeEspecialidade}}</td>
				    <td><input type="checkbox" checklist-model="especialidadesDiarista" checklist-value="especialidade.codigoEspecialidade"/></td>				    				    
				  </tr>				 
				</table>
<!-- 				<p>Teste itens selecionados:</p> -->
<!-- 				<p>{{especialidadesDiarista}}</p> -->
				<br>
				</div>								
				<div class="field">
					<label for="email">Email:</label>
					<input ng-model="pessoa.email" type="text" id="email" name="email" value="" placeholder="Email" class="login" required="required" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"/>
				</div> <!-- /field -->
				
				<div class="field">
					<label for="password">Senha:</label>
					<input ng-model="pessoa.senha" type="password" id="password" name="password" value="" placeholder="Senha (Min 8, Max 14)" class="login" pattern=".{8,}" maxlength="14" required/>
				</div> <!-- /field -->
				
<!-- 				<div class="field"> -->
<!-- 					<label for="confirm_password">Confirmar senha:</label> -->
<!-- 					<input type="password" id="confirm_password" name="confirm_password" value="" placeholder="Confirmar senha" class="login" required/> -->
<!-- 				</div> /field				 -->
				
			</div> <!-- /login-fields -->
			
			<div class="login-actions">
				
				<span class="login-checkbox">
					<input ng-model="termos" id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" required/>
					<label class="choice" for="Field">Eu aceito os termos e condições de uso.</label>
				</span>
									
				<button type="submit" class="button btn btn-primary btn-large" ng-click="createPeople(newPeopleForm)">Registrar</button>
                
			</div> <!-- .actions -->
			
		</form>
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->


<!-- Text Under Box -->
<!-- <div class="login-extra"> -->
<!-- 	Você já tem uma conta? <a href="/cleanUp/login">Faça login na sua conta</a> -->
<!-- </div> /login-extra -->

    <!-- jQuery Version 1.11.0 -->    
    <script src="<c:url value='/resources/js/jquery-1.7.2.min.js' />"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value='/resources/js/js-template/bootstrap.js' />"></script>
    <script src="<c:url value='/resources/js/bootbox.min.js' />"></script>    
    <script src="<c:url value='/resources/js/js-template/signin.js' />"></script>
    <script src="<c:url value='/resources/js/js-template/jquery.mask.min.js' />"></script>
	<script src="<c:url value='/resources/js/js-template/jquery.mask.js' />"></script>  
    <script src="<c:url value='/public/controller/cadastroController.js' />"></script>
    <script src="<c:url value='/resources/js/validacaoDeCamposCadastro.js' />"></script>
    <script src="<c:url value='/resources/js/checklist-model.js' />"></script>
    