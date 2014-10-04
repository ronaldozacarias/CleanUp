<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!--WRAPPER-->
<div id="wrapper" ng-controller="loginController">

	<!--SLIDE-IN ICONS-->
    <div class="user-icon"></div>
    <div class="pass-icon"></div>
    <!--END SLIDE-IN ICONS-->

<!--LOGIN FORM-->
<form name="login-form" class="login-form" action="j_spring_security_check" method="post">

	<!--HEADER-->
    <div class="header">
    <!--TITLE-->
    <h1>
    	<a class="linklogo" href="/cleanUp">
    	<img id="logo" src="<c:url value='/resources/img/logosolo.png'  />" title="logo"/>
    	<spring:message code='project.name'/>
    	</a>
    </h1>
    <!--END TITLE-->
    
	<%--     <legend><spring:message code="login.header" /></legend> --%>
    </div>
    <!--END HEADER-->
	
	<!--CONTENT-->
    <div class="content">
	<!--USERNAME--><input name="j_username" id="j_username" type="text" class="input username" placeholder="<spring:message code='sample.email' /> " /><!--END USERNAME-->
    <!--PASSWORD--><input name="j_password" id="j_password" type="password" class="input password" placeholder="Password" /><!--END PASSWORD-->
    <div class="alert alert-error" ng-class="{'': displayLoginError == true, 'none': displayLoginError == false}">
        <br>
        <span id="alert"><spring:message code="login.error" /></span>
    </div>
    </div>
    <!--END CONTENT-->
    
    <!--FOOTER-->
    <div class="footer">
    <!--LOGIN BUTTON--><input type="submit" name="submit" value="<spring:message code="login.signIn" />" class="button" /><!--END LOGIN BUTTON-->
    <!--REGISTER BUTTON--><button >
    						<a class="register" href="public/cadastro/" class="scroll">Registrar</a>
    					  </button><!--END REGISTER BUTTON-->
    </div>
    <!--END FOOTER-->

</form>
<!--END LOGIN FORM-->

</div>
<!--END WRAPPER-->

<!--GRADIENT--><div class="gradient"></div><!--END GRADIENT-->
<script src="<c:url value='/resources/js/pages/login.js' />"></script>