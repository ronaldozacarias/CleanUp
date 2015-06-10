<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- START wrapper-->
   <div ng-controller="loginController" class="row row-table page-wrapper">
      <div class="col-lg-3 col-md-6 col-sm-8 col-xs-12 align-middle">
         <!-- START panel-->
         <div data-toggle="play-animation" data-play="fadeIn" data-offset="0" class="panel panel-dark panel-flat">
            <div class="panel-heading text-center">
               <a href="/cleanUp/">
                  <img src="<c:url value='/resources/assets/img/logo.png'  />" alt="Image" class="block-center img-rounded"/>
               </a>
               <p class="text-center mt-lg">
                  <strong>Realize o login para continuar.</strong>
               </p>
            </div>
            <div class="panel-body">
               <form role="form" class="mb-lg" action="j_spring_security_check" method="post">
                  <div class="text-right mb-sm"><a href="/cleanUp/public/cadastro" class="text-muted">Não possui cadastro?</a>
                  </div>
                  
                  <div class="form-group has-feedback">
				 <!--<input id="exampleInputEmail1" type="email" placeholder="Enter email" class="form-control"> -->
                     <input name="j_username" id="j_username" type="email" class="form-control" placeholder="Seu email: exemplo@email.com" />
                     <span class="fa fa-envelope form-control-feedback text-muted"></span>
                  </div>
                  
                  <div class="form-group has-feedback">
			  <!--<input id="exampleInputPassword1" type="password" placeholder="Password" class="form-control"> -->
                     <input name="j_password" id="j_password" type="password" class="form-control" placeholder="Sua Senha" />
                     <span class="fa fa-lock form-control-feedback text-muted"></span>
                  </div>
                  
                  <div class="form-group has-feedback">
                  		<div class="alert alert-danger alert-dismissable" ng-class="{'': displayLoginError == true, 'none': displayLoginError == false}">                           	
                           	<span id="alert"><spring:message code="login.error" /></span>                           	
                        </div>
                  </div>                    
                  
                  <div class="clearfix">
<!--                      <div class="checkbox c-checkbox pull-left mt0"> -->
<!--                         <label> -->
<!--                            <input type="checkbox" value=""> -->
<!--                            <span class="fa fa-check"></span>Remember Me</label> -->
<!--                      </div> -->
                     <div class="pull-right">
<!--                      	<a href="#" class="text-muted">Forgot your password?</a> -->
                     </div>
                  </div>
                  <button type="submit" class="btn btn-block btn-success" ng-click="spinner();">Login</button>
               </form>
            </div>
         </div>
         <!-- END panel-->
      </div>
   </div>
   <!-- END wrapper-->

   <!-- START Scripts-->
   <!-- Main vendor Scripts-->
   <script src="<c:url value='/resources/assets/jquery/jquery.min.js' />"></script>
   <script src="<c:url value='/resources/assets/bootstrap/js/bootstrap.min.js' />"></script>
   
   <script src="<c:url value='/resources/assets/jloader/js/jquery.oLoader.min.js' />" ></script>
   
   <!-- Animo-->
   <script src="<c:url value='/resources/assets/animo/animo.min.js' />"></script>
   <!-- Custom script for pages-->
   <script src="<c:url value='/resources/assets/js/pages.js' />"></script>
   <!-- END Scripts-->

   <script src="<c:url value='/public/controller/login.js' />"></script>