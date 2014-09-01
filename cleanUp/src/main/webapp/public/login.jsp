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
    
    <!--DESCRIPTION-->
<!--     <span> -->
<!--         <div class="alert alert-error" ng-class="{'': displayLoginError == true, 'none': displayLoginError == false}"> -->
<%--             <spring:message code="login.error" /> --%>
<!--         </div> -->
<!--     </span> -->
    <!--END DESCRIPTION-->
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
    						<a class="register" href="registrar" class="scroll">Registrar</a>
    					  </button><!--END REGISTER BUTTON-->
    </div>
    <!--END FOOTER-->

</form>
<!--END LOGIN FORM-->

</div>
<!--END WRAPPER-->

<!--GRADIENT--><div class="gradient"></div><!--END GRADIENT-->




<!-- NÃO FAZ PARTE DO TEMPLATE INICIO -->

<!-- <div class="row-fluid"> -->
<!--     <div class="jumbotron"> -->
<%--         <h1><spring:message code='project.name'/></h1> --%>
<%--         <img src="<c:url value='/resources/img/brand-logo1.png'  />" title="the verge"/> --%>
<!--     </div> -->
<!-- </div> -->
<!-- <div class="row-fluid"> -->
<!--     <div class="span4 offset4 well" ng-controller="loginController"> -->
<%--         <legend><spring:message code="login.header" /></legend> --%>
<!--         <div class="alert alert-error" ng-class="{'': displayLoginError == true, 'none': displayLoginError == false}"> -->
<%--             <spring:message code="login.error" /> --%>
<!--         </div> -->
<!--         <form method="post" action="j_spring_security_check"> -->
<!--             <div> -->
<%--                 <input name="j_username" id="j_username" type="text" class="span12" placeholder="<spring:message code='sample.email' /> "><br/> --%>
<!--                 <input name="j_password" id="j_password" type="password"  class="span12" placeholder="Password"><br/> -->
<%--                 <button type="submit" name="submit" class="btn btn-inverse btn-block"><spring:message code="login.signIn" /></button> --%>
<!--             </div> -->
<!--         </form> -->
<!--     </div> -->
<!-- </div> -->

<!-- NÃO FAZ PARTE DO TEMPLATE FIM  -->

<script src="<c:url value='/resources/js/pages/login.js' />"></script>