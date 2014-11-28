<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- START Top Navbar-->
      <nav role="navigation" class="navbar navbar-default navbar-top navbar-fixed-top">
         <!-- START navbar header-->
         <div class="navbar-header">
            <a href="dashboard.html" class="navbar-brand">
               <div class="brand-logo">
                  <img src="<c:url value='/resources/assets/img/logo.png'  />" alt="App Logo" class="img-responsive"/>
               </div>
               <div class="brand-logo-collapsed">
                  <img src="<c:url value='/resources/assets/img/logo-single.png'  />" alt="App Logo" class="img-responsive"/>
               </div>
            </a>
         </div>
         <!-- END navbar header-->
         <!-- START Nav wrapper-->
         <div class="nav-wrapper">
            <!-- START Left navbar-->
            <ul class="nav navbar-nav">
               <li>
                  <!-- Button used to collapse the left sidebar. Only visible on tablet and desktops-->
                  <a href="#" data-toggle-state="aside-collapsed" data-persists="true" class="hidden-xs">
                     <em class="fa fa-navicon"></em>
                  </a>
                  <!-- Button to show/hide the sidebar on mobile. Visible on mobile only.-->
                  <a href="#" data-toggle-state="aside-toggled" class="visible-xs">
                     <em class="fa fa-navicon"></em>
                  </a>
               </li>
               <!-- START Messages menu (dropdown-list)-->
               <li class="dropdown dropdown-list">                  
                  <!-- START Dropdown menu-->
                  <ul class="dropdown-menu">
                     <li class="dropdown-menu-header">You have 5 new messages</li>
                     <li>
                        <div class="scroll-viewport">
                           <!-- START list group-->
                           <div class="list-group scroll-content">
                              <!-- START list group item-->
                              <a href="#" class="list-group-item">
                                 <div class="media">
                                    <div class="pull-left">
                                       <img src="<c:url value='/resources/assets/img/user/01.jpg'  />" alt="Image" class="media-object img-circle thumb48"/>
                                    </div>
                                    <div class="media-body clearfix">
                                       <small class="pull-right">2h</small>
                                       <strong class="media-heading text-primary">
                                          <span class="point point-success point-md"></span>Rina Carter</strong>
                                       <p class="mb-sm">
                                          <small>Curabitur sodales nisl eu enim suscipit eu faucibus dui mattis.</small>
                                       </p>
                                    </div>
                                 </div>
                              </a>
                              <!-- END list group item-->
                              <!-- START list group item-->
                              <a href="#" class="list-group-item">
                                 <div class="media">
                                    <div class="pull-left">
                                       <img src="<c:url value='/resources/assets/img/user/04.jpg'  />" alt="Image" class="media-object img-circle thumb48"/>
                                    </div>
                                    <div class="media-body clearfix">
                                       <small class="pull-right">3h</small>
                                       <strong class="media-heading text-primary">
                                          <span class="point point-success point-md"></span>Michael Reynolds</strong>
                                       <p class="mb-sm">
                                          <small>Curabitur sodales nisl eu enim suscipit eu faucibus dui mattis.</small>
                                       </p>
                                    </div>
                                 </div>
                              </a>
                              <!-- END list group item-->
                              <!-- START list group item-->
                              <a href="#" class="list-group-item">
                                 <div class="media">
                                    <div class="pull-left">
                                       <img src="<c:url value='/resources/assets/img/user/03.jpg'  />" alt="Image" class="media-object img-circle thumb48"/>
                                    </div>
                                    <div class="media-body clearfix">
                                       <small class="pull-right">4h</small>
                                       <strong class="media-heading text-primary">
                                          <span class="point point-danger point-md"></span>Britanny Pierce</strong>
                                       <p class="mb-sm">
                                          <small>Curabitur sodales nisl eu enim suscipit eu faucibus dui mattis.</small>
                                       </p>
                                    </div>
                                 </div>
                              </a>
                              <!-- END list group item-->
                              <!-- START list group item-->
                              <a href="#" class="list-group-item">
                                 <div class="media">
                                    <div class="pull-left">
                                       <img src="<c:url value='/resources/assets/img/user/05.jpg'  />" alt="Image" class="media-object img-circle thumb48"/>
                                    </div>
                                    <div class="media-body clearfix">
                                       <small class="pull-right">4h</small>
                                       <strong class="media-heading text-primary">
                                          <span class="point point-danger point-md"></span>Laura Cole</strong>
                                       <p class="mb-sm">
                                          <small>Curabitur sodales nisl eu enim suscipit eu faucibus dui mattis.</small>
                                       </p>
                                    </div>
                                 </div>
                              </a>
                              <!-- END list group item-->
                              <!-- START list group item-->
                              <a href="#" class="list-group-item">
                                 <div class="media">
                                    <div class="pull-left">
                                       <img src="<c:url value='/resources/assets/img/user/06.jpg'  />" alt="Image" class="media-object img-circle thumb48"/>
                                    </div>
                                    <div class="media-body clearfix">
                                       <small class="pull-right">4h</small>
                                       <strong class="media-heading text-primary">
                                          <span class="point point-danger point-md"></span>Carolyn Pretty</strong>
                                       <p class="mb-sm">
                                          <small>Curabitur sodales nisl eu enim suscipit eu faucibus dui mattis.</small>
                                       </p>
                                    </div>
                                 </div>
                              </a>
                              <!-- END list group item-->
                           </div>
                           <!-- END list group-->
                        </div>
                     </li>
                     <!-- START dropdown footer-->
                     <li class="p">
                        <a href="#" class="text-center">
                           <small class="text-primary">READ ALL</small>
                        </a>
                     </li>
                     <!-- END dropdown footer-->
                  </ul>
                  <!-- END Dropdown menu-->
               </li>
               <!-- END Messages menu (dropdown-list)-->
               
            </ul>
            <!-- END Left navbar-->
            <!-- START Right Navbar-->
            <ul class="nav navbar-nav navbar-right">
               <!-- Search icon-->
               <li>
                  <a href="#" data-toggle="navbar-search">
                     <em class="fa fa-search"></em>
                  </a>
               </li>
               <!-- START Alert menu-->
               <li class="dropdown dropdown-list">
                  <a href="#" data-play="fadeIn" class="dropdown-toggle">
                     <em class="fa fa-bell-o"></em>
                     <div class="label label-info" ng-show="count > 0">{{count}}</div>
                  </a>
                  <!-- START Dropdown menu-->
                  <ul class="dropdown-menu">
                     <li>
                        <!-- START list group-->
                        <div class="list-group">
                           <!-- list item-->
                           <a ng-show="profile == 'ROLE_DIARIST'" href="{{linkNotificacoes}}" class="list-group-item" ng-repeat="notificacao in notificacoes">
                              <div class="media" ng-show="notificacao.status == 'PENDENTE'" ng-click="abriModal()">
                                 <div class="pull-left">
                                    <em class="fa fa-question fa-2x text-info"></em>
                                 </div>
                                 <div class="media-body clearfix">
                                    <div class="media-heading">{{notificacao.descricaoNotificacao}}</div>
                                 </div>
                              </div>
                              
                              <div class="media" ng-show="notificacao.status == 'ENCERRADA'" ng-click="setarnotificaaoConcluida()">
                                 <div class="pull-left">
                                    <em class="fa fa-times fa-2x text-danger"></em>
                                 </div>
                                 <div class="media-body clearfix">
                                    <div class="media-heading">{{notificacao.descricaoNotificacao}}</div>
                                 </div>
                              </div>
                           </a>
                           <a ng-show="profile == 'ROLE_CLIENT'" href="{{linkNotificacoes}}" class="list-group-item" ng-repeat="notificacao in notificacoes">
                              <div class="media" ng-show="notificacao.status == 'CONCLUIDA'" ng-click="abriModal()">
                                 <div class="pull-left">
                                    <em class="fa fa-check fa-2x text-success"></em>
                                 </div>
                                 <div class="media-body clearfix">
                                    <div class="media-heading">{{notificacao.descricaoNotificacao}}</div>
                                 </div>
                              </div>
                              
                              <div class="media" ng-show="notificacao.status == 'CANCELADA'" ng-click="setarnotificaaoConcluida()">
                                 <div class="pull-left">
                                    <em class="fa fa-times fa-2x text-danger"></em>
                                 </div>
                                 <div class="media-body clearfix">
                                    <div class="media-heading">{{notificacao.descricaoNotificacao}}</div>
                                 </div>
                              </div>
                           </a>                           
                           <!-- last list item -->
                           <a href="{{linkNotificacoes}}" class="list-group-item">
                           	  <em class="fa fa-mail-forward"></em>
                              <small>Todas notificações...</small>
                              
<!--                               <span class="badge">14</span> -->
                           </a>
                        </div>
                        <!-- END list group-->
                     </li>
                  </ul>
                  <!-- END Dropdown menu-->
               </li>
               <!-- END Alert menu-->
               <!-- START User menu-->
               <li class="dropdown">
                  <a href="#" data-play="fadeIn" class="dropdown-toggle">
                     <em class="fa fa-gear"></em>
                  </a>
                  <!-- START Dropdown menu-->
                  <ul class="dropdown-menu">
<!--                      <li> -->
<!--                         <div class="p"> -->
<!--                            <p>Overall progress</p> -->
<!--                            <div class="progress progress-striped progress-xs m0"> -->
<!--                               <div role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-success progress-70"> -->
<!--                                  <span class="sr-only">70% Complete</span> -->
<!--                               </div> -->
<!--                            </div> -->
<!--                         </div> -->
<!--                      </li> -->
<!--                      <li class="divider"></li> -->
                     <li><a href="{{linkPerfil}}"><em class="fa fa-user">&nbsp&nbsp</em>Perfil</a>
                     </li>
<!--                      <li><a href="#">Settings</a> -->
<!--                      </li> -->
<!--                      <li><a href="#">Notifications<div class="label label-info pull-right">5</div></a> -->
<!--                      </li> -->
<!--                      <li><a href="#">Messages<div class="label label-danger pull-right">10</div></a> -->
<!--                      </li> -->
                     <li><a href="<c:url value='/logout' />"><em class="fa fa-sign-out">&nbsp&nbsp</em>Sair</a>
                     </li>
                  </ul>
                  <!-- END Dropdown menu-->
               </li>
               <!-- END User menu-->
               <!-- START Contacts button-->
               <!-- END Contacts menu-->
            </ul>
            <!-- END Right Navbar-->
         </div>
         <!-- END Nav wrapper-->
         <!-- START Search form-->
         <form role="search" class="navbar-form">
            <div class="form-group has-feedback">
               <input ng-model="searchString" ng-change="filter()" type="text" placeholder="Informe o termo da busca.." class="form-control">
               <div data-toggle="navbar-search-dismiss" class="fa fa-times form-control-feedback"></div>
            </div>
            <button type="submit" class="hidden btn btn-default">Submit</button>
         </form>
         <!-- END Search form-->
      </nav>
      <!-- END Top Navbar-->