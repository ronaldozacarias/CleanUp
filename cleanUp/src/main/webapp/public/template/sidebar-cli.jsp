<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- START aside-->
      <aside class="aside">
         <!-- START Sidebar (left)-->
         <nav class="sidebar">
            <!-- START user info-->
            <a href="{{linkPerfil}}">
            <div class="item user-block">
               <!-- User picture-->
               <div class="user-block-picture">
                  <div class="user-block-status">
                     <img src="<c:url value='{{clienteVO.fotoUsuario}}'  />" alt="Avatar" width="60" height="60" class="img-thumbnail img-circle"/>
                     <div class="point point-success point-lg"></div>
                  </div>
                  <!-- Status when collapsed-->
               </div>
               <!-- Name and Role-->
               <div class="user-block-info">
                  <span class="user-block-name item-text"><spring:message code="welcome" /> ${usuario.apelido}</span>
                  <span class="user-block-role"><spring:message code="header.message" /></span>
               </div>
            </div>
            </a>
            <!-- END user info-->
            <ul class="nav">
               <!-- START Menu-->
               </br>
               <li ng-repeat="menu in menus">
                  <a href="{{menu.link}}" title="{{menu.descricao}}" data-toggle="" class="has-submenu">
                     <em class='{{menu.icone}}'></em>
                     <span class="item-text">{{menu.descricao}}</span>
                  </a>                  
               </li>               
            </ul>
         </nav>
         <!-- END Sidebar (left)-->
      </aside>
      <!-- End aside-->