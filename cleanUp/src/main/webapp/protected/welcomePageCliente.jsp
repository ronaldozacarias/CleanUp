<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Header -->
    <!-- Services Section -->

        <div class="container" ng-controller="clienteController">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1 class="section-heading">ola cliente!</h1>
                </div>
            </div>
            
            <div id="map-canvas" style="width: 970px; height: 336px"></div>
            
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">E-Commerce</h4>
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-laptop fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Responsive Design</h4>
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Web Security</h4>
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                </div>
            </div>
        </div>

    <!-- jQuery Version 1.11.0 -->    
    <script src="<c:url value='/resources/js/jquery.min.js' />"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js' />"></script>
    <script src="<c:url value='/resources/js/classie.js' />"></script>
    <script src="<c:url value='/resources/js/cbpAnimatedHeader.js' />"></script>

    <!-- Contact Form JavaScript -->
    <script src="<c:url value='/resources/js/jqBootstrapValidation.js' />"></script>
    <script src="<c:url value='/resources/js/contact_me.js' />"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<c:url value='/resources/js/agency.js' />"></script>
    
    <!-- Maps API Javascript -->
    <script src="<c:url value='http://maps.googleapis.com/maps/api/js?sensor=false' />"></script>
        
    <!-- Caixa de informação -->
    <script src="<c:url value='/resources/js/infobox.js' />"></script>
		
    <!-- Agrupamento dos marcadores -->
    <script src="<c:url value='/resources/js/markerclusterer.js' />"></script>
    
    <!-- Arquivo de inicialização do mapa -->
	<script src="<c:url value='/resources/js/mapa.js' />"></script>
    
    <script src="<c:url value='/resources/js/pages/clienteController.js' />"></script>
    
    
    
    