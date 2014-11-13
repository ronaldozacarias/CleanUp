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
		<script src="<c:url value='/resources/js/angular-sanitize.js' />"></script>		
		<script src="<c:url value='/resources/js/angular-locale_pt-br.js' />"></script>
		<script src="<c:url value='/resources/js/ui-bootstrap-tpls-0.11.2.min.js' />"></script>
		<script src="<c:url value='/resources/js/select.js' />"></script>
		<script src="<c:url value='/resources/css/select.css' />"></script>
		<script src="<c:url value='/public/util.js' />"></script>
		<link href="<c:url value='/resources/css/css-template/bootstrap.min.css'  />" rel="stylesheet" type="text/css"/>
		<link href="<c:url value='/resources/css/css-template/bootstrap-responsive.min.css'  />" rel="stylesheet" type="text/css"/>
		<link href="<c:url value='/resources/css/font-awesome.css' />" rel="stylesheet" type="text/css"/>
    	<link href="<c:url value='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' />" rel="stylesheet" type="text/css"/>
    	<link href="<c:url value='/resources/css/css-template/style.css' />" rel="stylesheet" type="text/css"/>
		<link href="<c:url value='/resources/css/css-template/stylelogin.css' />" rel="stylesheet" type="text/css"/>
    	<link href="<c:url value='/resources/css/css-template/styleDashBord.css' />" rel="stylesheet" type="text/css"/>
		<link href="<c:url value='/resources/css/pages/signin.css' />" rel="stylesheet" type="text/css"/>
		
		<link href="<c:url value='http://cdnjs.cloudflare.com/ajax/libs/select2/3.4.5/select2.css' />" rel="stylesheet" type="text/css"/>
		<link href="<c:url value='http://cdnjs.cloudflare.com/ajax/libs/select2/3.4.5/select2.css' />" rel="stylesheet" type="text/css"/>
		<link href="<c:url value='http://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.8.5/css/selectize.default.css' />" rel="stylesheet" type="text/css"/>
			    
		<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
		      <script src="<c:url value='http://html5shim.googlecode.com/svn/trunk/html5.js' />"></script>
		    <![endif]-->
		    
		    
		<style>
		
		    .select2 > .select2-choice.ui-select-match {
		      /* Because of the inclusion of Bootstrap */
		      height: 29px;
		    }
		
		    .selectize-control > .selectize-dropdown {
		      top: 36px;
		    }
		  </style>
	                    
    </head>
    <body>
<%--             <tiles:insertAttribute name="header" /> --%>

            <tiles:insertAttribute name="body" />
<!--         </div> -->

<%--         	<tiles:insertAttribute name="footer" /> --%>
    </body>
</html>