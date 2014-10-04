<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html lang="pt-BR" id="ng-app" ng-app="">
<head>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    	<meta name="apple-mobile-web-app-capable" content="yes">
    	
        <title><spring:message  code="project.title" /></title>
        
        <link href="<c:url value='/resources/css/css-template/bootstrap.min.css'  />" rel="stylesheet" type="text/css"/>
		<link href="<c:url value='/resources/css/css-template/bootstrap-responsive.min.css'  />" rel="stylesheet" type="text/css"/>
        
        <link href="<c:url value='/resources/css/font-awesome.css' />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'  />" rel="stylesheet" type="text/css"/>
        
        <script src="<c:url value='/resources/js/angular.min.js' />"></script>
		
		<link href="<c:url value='/resources/css/css-template/style.css' />" rel="stylesheet" type="text/css"/>
		<link href="<c:url value='/resources/css/css-template/stylelogin.css' />" rel="stylesheet" type="text/css"/>
		<link href="<c:url value='/resources/css/pages/signin.css' />" rel="stylesheet" type="text/css"/>
		           
    </head>
    <body>
<!--         <div class="container"> -->
            <tiles:insertAttribute name="header" />

            <tiles:insertAttribute name="body" />
<!--         </div> -->

<%--         <tiles:insertAttribute name="footer" /> --%>
    </body>
</html>