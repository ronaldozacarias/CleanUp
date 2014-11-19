<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="ie ie6 lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="ie ie7 lt-ie9 lt-ie8"        lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="ie ie8 lt-ie9"               lang="en"> <![endif]-->
<!--[if IE 9]>    <html class="ie ie9"                      lang="en"> <![endif]-->
<!--[if !IE]><!-->
<html lang="pt-BR" class="no-ie" id="ng-app" ng-app="app">
<!--<![endif]-->

	<head>
	
	   <!-- Meta-->
	   <meta charset="utf-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
	   <meta name="description" content="">
	   <meta name="keywords" content="">
	   <meta name="author" content="">
	   <title>CleanUp - Encontrando diaristas de maneira inteligente.</title>
	   <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	   <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script><![endif]-->
	   
	   <!-- AngularJs -->
	   <script src="<c:url value='/resources/js/angular.min.js' />"></script>	   
	   <script src="<c:url value='/resources/js/angular-locale_pt-br.js' />"></script>
	   <script src="<c:url value='/resources/js/ui-bootstrap-tpls-0.11.2.min.js' />"></script>	
	   <!-- Bootstrap CSS-->
	   <link href="<c:url value='/resources/assets/css/bootstrap.css'  />" rel="stylesheet"/>
	   
	   
	   <!-- Vendor CSS-->
	   <link href="<c:url value='/resources/assets/fontawesome/css/font-awesome.min.css'  />" rel="stylesheet"/>
	   <link href="<c:url value='/resources/assets/animo/animate+animo.css'  />" rel="stylesheet"/>
	   <link href="<c:url value='/resources/assets/csspinner/csspinner.min.css'  />" rel="stylesheet"/>
	  
	   <!-- START Page Custom CSS-->
	   <!-- END Page Custom CSS-->
	   <!-- App CSS-->
	   <link href="<c:url value='/resources/assets/css/app.css'  />" rel="stylesheet"/>
	   
	   <!-- Modernizr JS Script-->
	   <script src="<c:url value='/resources/assets/modernizr/modernizr.js' />" type="application/javascript"></script>
	   
	   <!-- FastClick for mobiles-->
	   <script src="<c:url value='/resources/assets/fastclick/fastclick.js' />" type="application/javascript"></script>
	   
	   <!-- Bootstrap Datepicker -->
   	   <link href="<c:url value='/resources/assets/slider/css/slider.css'  />" rel="stylesheet"/>
   	   <link href="<c:url value='/resources/assets/chosen/chosen.min.css'  />" rel="stylesheet"/>
	   <link href="<c:url value='/resources/assets/datetimepicker/css/bootstrap-datetimepicker.min.css'  />" rel="stylesheet"/>	   
	   
	   <script src="<c:url value='http://maps.googleapis.com/maps/api/js?sensor=false' />"></script>
	   
	   <script type="text/javascript">

	   

	   </script>
	        
	</head>
	
    <body>
		<!-- START Main wrapper-->
   		<div class="wrapper" ng-controller="clienteController">
            <tiles:insertAttribute name="header" />
            
            <tiles:insertAttribute name="sidebar" />

            <tiles:insertAttribute name="body" />


        <!--[if IE]>
            <script src="<c:url value='/resources/js/bootstrap.min.ie.js' />"></script>
        <![endif]-->
        <!--[if !IE]><!-->
        <!--<![endif]-->
		
		</div>
		<!-- END Main wrapper-->
<%--         <tiles:insertAttribute name="footer" /> --%>
    </body>
</html>