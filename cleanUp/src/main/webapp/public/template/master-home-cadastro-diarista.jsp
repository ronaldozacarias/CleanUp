<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html lang="pt-BR" id="ng-app" ng-app="app">
<head>
        <title><spring:message  code="project.title" /></title>
            
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		
		<script src="<c:url value='/resources/js/angular.min.js' />"></script>
		<script src="<c:url value='/public/util.js' />"></script>
		<link href="<c:url value='/resources/css/bootstrap2.min.css'  />" rel="stylesheet" type="text/css"/>
		<link href="<c:url value='/resources/css/bootstrap-responsive.min.css'  />" rel="stylesheet" type="text/css"/>
		<link href="<c:url value='/resources/css/font-awesome.css' />" rel="stylesheet" type="text/css"/>
    	<link href="<c:url value='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' />" rel="stylesheet" type="text/css"/>
    	<link href="<c:url value='/resources/css/styleDashBord.css' />" rel="stylesheet" type="text/css"/>
		<link href="<c:url value='/resources/css/pages/signin.css' />" rel="stylesheet" type="text/css"/>
	    
		<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
		      <script src="<c:url value='http://html5shim.googlecode.com/svn/trunk/html5.js' />"></script>
		    <![endif]-->
		    
		<script type="text/javascript">

			var app = angular.module("app", ["checklist-model"]);

		</script>	
	                    
    </head>
    <body>
<%--             <tiles:insertAttribute name="header" /> --%>

            <tiles:insertAttribute name="body" />
<!--         </div> -->

<%--         	<tiles:insertAttribute name="footer" /> --%>
    </body>
</html>