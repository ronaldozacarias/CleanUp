<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html lang="pt-BR" id="ng-app" ng-app="">
<head>
        <title><spring:message  code="project.title" /></title>
            
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <!-- Bootstrap Core CSS -->
	    <link href="<c:url value='/resources/css/css-home/bootstrap.min.css'  />" rel="stylesheet" type="text/css"/>
	    
	    <!-- Custom CSS -->
	    <link href="<c:url value='/resources/css/css-home/agency.css' />" rel="stylesheet" type="text/css"/>
	
	    <!-- Custom Fonts -->
	    <link href="<c:url value='/resources/font-awesome-4.1.0/css/font-awesome.min.css' />" rel="stylesheet" type="text/css"/>
	    <link href="<c:url value='http://fonts.googleapis.com/css?family=Montserrat:400,700' />" rel="stylesheet" type="text/css"/>
	    <link href="<c:url value='http://fonts.googleapis.com/css?family=Kaushan+Script' />" rel="stylesheet" type="text/css"/>
	    <link href="<c:url value='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' />" rel="stylesheet" type="text/css"/>
	    <link href="<c:url value='http://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' />" rel="stylesheet" type="text/css"/>
	                    
    </head>
    <body id="page-top" class="index">
            <tiles:insertAttribute name="header" />

            <tiles:insertAttribute name="body" />
<!--         </div> -->

        	<tiles:insertAttribute name="footer" />
    </body>
</html>