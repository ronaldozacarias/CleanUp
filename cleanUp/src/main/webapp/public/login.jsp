<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<div class="account-container" ng-controller="loginController">
	
	<div class="content clearfix">
		
		<form action="j_spring_security_check" method="post">
		
			<h1>
<!-- 				<a class="linklogo" href="/cleanUp"> -->
<%-- 		    	<img id="logoBarra" src="<c:url value='/resources/img/CleanUp.png'  />" title="logo"/> --%>
<!-- 		    	</a> -->
				Login
			</h1>		
			
			<div class="login-fields">
				
				<p>Por favor, forneça suas informaçoes</p>
				
				<div class="field">
					<label for="username">Username</label>
					<input name="j_username" id="j_username" type="text" class="login username-field" placeholder="Seu email: exemplo@email.com" />
				</div> <!-- /field -->
				
				<div class="field">
					<label for="password">Password:</label>					
					<input name="j_password" id="j_password" type="password" class="login password-field" placeholder="Sua Senha" />
				</div> <!-- /password -->
				
				<div class="alert alert-error" ng-class="{'': displayLoginError == true, 'none': displayLoginError == false}">
			        <span id="alert"><spring:message code="login.error" /></span>
			    </div><!-- /AlertError -->
				
			</div> <!-- /login-fields -->
			
			<div class="login-actions">
				
				<span class="login-checkbox">					
					<input id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
					<label class="choice" for="Field">Mantenha-me conectado</label>
				</span>
									
				<button class="button btn btn-success btn-large">Logar</button>
				
			</div> <!-- .actions -->
			
			
			
		</form>
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->



<div class="login-extra">
<!-- 	<a href="#">Reset Password</a> -->
	<a href="public/cadastro/" class="scroll">Registrar</a>
</div> <!-- /login-extra -->

<script src="<c:url value='/resources/js/jquery-1.7.2.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/bootstrap.js' />"></script>
<script src="<c:url value='/resources/js/js-template/signin.js' />"></script>


<script src="<c:url value='/public/controller/login.js' />"></script>