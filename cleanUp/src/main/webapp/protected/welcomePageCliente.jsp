<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- START Main section-->
      <section>
           
         <!-- START Page content-->
         <div class="main-content">
         
         	<button type="button" class="btn btn-oval btn-primary pull-right">
         	<em class="fa fa-question fa-fw mr-sm"></em>Help</button>
         	
            <h3><spring:message code="homePage" />
               <br>
               <small><spring:message code="homePageSmall" /></small>
            </h3>
            
            <div class="row">
               <!-- START dashboard main content-->
               <section class="col-md-13">
               
                 <div class="col-lg-7">
                  <!-- START widget-->
                  <div class="panel widget">
                     <div class="panel-body tomwel">
                        <div class="media p mt0">
                           <div class="pull-left">
                              <img src="<c:url value='/resources/assets/img/user/05.jpg'  />" alt="Avatar" width="60" height="60" class="img-thumbnail img-circle"/>
                           </div>
                           <div class="media-body">
                              <div class="media-heading masterdiarista">
                                 <h3 class="mt0"> {{MasterDiarista.nome}}</h3>
                                 <ul class="list-unstyled">
                                    <li class="mb-sm">
                                       <em class="fa fa-map-marker fa-fw"></em> {{MasterDiarista.cidade.nomeCidade}}</li>
                                    
                                    <li class="mb-sm">
                                       <em class="fa fa-envelope fa-fw"></em> {{MasterDiarista.usuario.email}}</li>
                                       
                                    <li class="mb-sm ng-binding">
	                                       <a href="" class="has-submenu">
	                                       <em class="fa fa-star fa-2x"></em></a></li>
                                 </ul>
                              </div>
                           	  <div class="media-heading pull-right">
                                 <img src="<c:url value='/resources/assets/img/medal.png'  />" alt="" width="90" height="90" class="img-responsive"/>                          
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="panel-body bg-inverse">
                        <div class="row row-table text-center">
                           <div class="col-xs-4">
                              <p class="m0 h3"> {{MasterDiarista.mediaDiarista | number:1}}</p>                              
                              <p class="m0 text-muted">Nota</p>
                           </div>
                           <div class="col-xs-4">
                              <p class="m0 h3">1500</p>
                              <p class="m0 text-muted">Solicitações de serviço</p>
                           </div>
                           <div class="col-xs-4">
                              <p class="m0 h3">1468</p>
                              <p class="m0 text-muted">Concluídos</p>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- END widget-->
                  </div>
                  
              <div class="col-lg-5">
                  <!-- START widget-->
                  <div class="panel widget">
                     <div data-zoom="14" data-address="Melbourne, Australia" data-toggle="gmap" class="gmap gmap-sm" style="position: relative; overflow: hidden; transform: translateZ(0px); background-color: rgb(229, 227, 223);"><div class="gm-style" style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0; cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1; width: 100%; transform-origin: 0px 0px 0px; transform: matrix(1, 0, 0, 1, 10, -4);"><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1;"><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 46px; top: -53px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -210px; top: -53px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 302px; top: -53px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 46px; top: -309px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -210px; top: -309px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 302px; top: -309px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 46px; top: 203px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -210px; top: 203px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 302px; top: 203px;"></div></div></div></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: -1;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1;"><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 46px; top: -53px;"><canvas draggable="false" height="256" width="256" style="-webkit-user-select: none; position: absolute; left: 0px; top: 0px; height: 256px; width: 256px;"></canvas></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: -210px; top: -53px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 302px; top: -53px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 46px; top: -309px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: -210px; top: -309px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 302px; top: -309px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 46px; top: 203px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: -210px; top: 203px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 302px; top: 203px;"></div></div></div></div><div style="position: absolute; z-index: 0; left: 0px; top: 0px;"><div style="overflow: hidden; width: 318px; height: 150px;"><img src="http://maps.googleapis.com/maps/api/js/StaticMapService.GetMapImage?1m2&amp;1i3785938&amp;2i2573621&amp;2e1&amp;3u14&amp;4m2&amp;1u318&amp;2u150&amp;5m6&amp;1e0&amp;5spt-BR&amp;6sus&amp;10b1&amp;11b1&amp;12b1&amp;token=70528" style="width: 318px; height: 150px;"></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1;"><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -210px; top: -53px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i14788!3i10053!2m3!1e0!2sm!3i280262013!3m9!2spt-BR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0!20m1!1b1" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; transform: translateZ(0px) translateZ(0px);"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 46px; top: -53px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i14!2i14789!3i10053!2m3!1e0!2sm!3i280266576!3m9!2spt-BR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0!20m1!1b1" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; transform: translateZ(0px) translateZ(0px);"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 302px; top: -53px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i14790!3i10053!2m3!1e0!2sm!3i280266576!3m9!2spt-BR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0!20m1!1b1" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; transform: translateZ(0px) translateZ(0px);"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 46px; top: -309px;"><img src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i14!2i14789!3i10052!2m3!1e0!2sm!3i280266576!3m9!2spt-BR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0!20m1!1b1" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; transform: translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px);"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -210px; top: -309px;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i14788!3i10052!2m3!1e0!2sm!3i280262013!3m9!2spt-BR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0!20m1!1b1" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; transform: translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px);"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 302px; top: -309px;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i14790!3i10052!2m3!1e0!2sm!3i280266576!3m9!2spt-BR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0!20m1!1b1" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; transform: translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px);"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 46px; top: 203px;"><img src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i14!2i14789!3i10054!2m3!1e0!2sm!3i280266576!3m9!2spt-BR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0!20m1!1b1" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; transform: translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px);"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -210px; top: 203px;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i14788!3i10054!2m3!1e0!2sm!3i280262013!3m9!2spt-BR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0!20m1!1b1" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; transform: translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px);"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 302px; top: 203px;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i14790!3i10054!2m3!1e0!2sm!3i280266576!3m9!2spt-BR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0!20m1!1b1" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; transform: translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px) translateZ(0px);"></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 2; width: 100%; height: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 3; width: 100%; transform-origin: 0px 0px 0px; transform: matrix(1, 0, 0, 1, 10, -4);"><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;"></div></div></div><div style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;"><a target="_blank" href="http://maps.google.com/maps?ll=-37.814378,144.962422&amp;z=14&amp;t=m&amp;hl=pt-BR&amp;gl=US&amp;mapclient=apiv3" title="Clique para ver esta área no Google Maps" style="position: static; overflow: visible; float: none; display: inline;"><div style="width: 62px; height: 26px; cursor: pointer;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/google_white2.png" draggable="false" style="position: absolute; left: 0px; top: 0px; width: 62px; height: 26px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></a></div><div class="gmnoprint" style="z-index: 1000001; position: absolute; right: 302px; bottom: 0px; width: 83px;"><div draggable="false" class="gm-style-cc" style="-webkit-user-select: none;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><a style="color: rgb(68, 68, 68); text-decoration: none; cursor: pointer;">Dados do mapa</a><span style="display: none;">Dados cartográficos ©2014 Google</span></div></div></div><div style="padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto, Arial, sans-serif; color: rgb(34, 34, 34); -webkit-box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; z-index: 10000002; display: none; width: 256px; height: 108px; position: absolute; left: 9px; top: 5px; background-color: white;"><div style="padding: 0px 0px 10px; font-size: 16px;">Dados do mapa</div><div style="font-size: 13px;">Dados cartográficos ©2014 Google</div><div style="width: 13px; height: 13px; overflow: hidden; position: absolute; opacity: 0.7; transform: translateZ(0px); right: 12px; top: 12px; z-index: 10000; cursor: pointer;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt3.png" draggable="false" style="position: absolute; left: -2px; top: -336px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></div><div class="gmnoscreen" style="position: absolute; right: 0px; bottom: 0px;"><div style="font-family: Roboto, Arial, sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">Dados cartográficos ©2014 Google</div></div><div class="gmnoprint gm-style-cc" draggable="false" style="z-index: 1000001; position: absolute; -webkit-user-select: none; right: 113px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><a href="http://www.google.com/intl/pt-BR_US/help/terms_maps.html" target="_blank" style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);">Termos de Uso</a></div></div><div draggable="false" class="gm-style-cc" style="-webkit-user-select: none; position: absolute; right: 0px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><a target="_new" title="Informar erros no mapa ou nas imagens para o Google" href="http://maps.google.com/maps?ll=-37.814378,144.962422&amp;z=14&amp;t=m&amp;hl=pt-BR&amp;gl=US&amp;mapclient=apiv3&amp;skstate=action:mps_dialog$apiref:1&amp;output=classic" style="font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;">Informar erro no mapa</a></div></div><div class="gmnoprint" draggable="false" controlwidth="78" controlheight="169" style="margin: 5px; -webkit-user-select: none; position: absolute; left: 0px; top: 0px;"><div class="gmnoprint" controlwidth="78" controlheight="80" style="cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default; width: 78px; height: 78px; position: absolute; left: 0px; top: 0px;"><div class="gmnoprint" controlwidth="78" controlheight="80" style="width: 78px; height: 78px; position: absolute; left: 0px; top: 0px;"><div style="visibility: hidden;"><svg version="1.1" overflow="hidden" width="78px" height="78px" viewBox="0 0 78 78" style="position: absolute; left: 0px; top: 0px;"><circle cx="39" cy="39" r="35" stroke-width="3" fill-opacity="0.2" fill="#f2f4f6" stroke="#f2f4f6"></circle><g transform="rotate(0 39 39)"><rect x="33" y="0" rx="4" ry="4" width="12" height="11" stroke="#a6a6a6" stroke-width="1" fill="#f2f4f6"></rect><polyline points="36.5,8.5 36.5,2.5 41.5,8.5 41.5,2.5" stroke-linejoin="bevel" stroke-width="1.5" fill="#f2f4f6" stroke="#000"></polyline></g></svg></div></div><div class="gmnoprint" controlwidth="59" controlheight="59" style="position: absolute; left: 10px; top: 11px;"><div style="width: 59px; height: 59px; overflow: hidden; position: relative;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt3.png" draggable="false" style="position: absolute; left: 0px; top: 0px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"><div title="Mover para a esquerda" style="position: absolute; left: 0px; top: 20px; width: 19.6666666666667px; height: 19.6666666666667px; cursor: pointer;"></div><div title="Mover para a direita" style="position: absolute; left: 39px; top: 20px; width: 19.6666666666667px; height: 19.6666666666667px; cursor: pointer;"></div><div title="Mover para cima" style="position: absolute; left: 20px; top: 0px; width: 19.6666666666667px; height: 19.6666666666667px; cursor: pointer;"></div><div title="Mover para baixo" style="position: absolute; left: 20px; top: 39px; width: 19.6666666666667px; height: 19.6666666666667px; cursor: pointer;"></div></div></div></div><div controlwidth="32" controlheight="40" style="cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default; position: absolute; left: 23px; top: 85px;"><div style="width: 32px; height: 40px; overflow: hidden; position: absolute; left: 0px; top: 0px;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout2.png" draggable="false" style="position: absolute; left: -9px; top: -102px; width: 1028px; height: 214px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 32px; height: 40px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout2.png" draggable="false" style="position: absolute; left: -107px; top: -102px; width: 1028px; height: 214px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 32px; height: 40px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout2.png" draggable="false" style="position: absolute; left: -58px; top: -102px; width: 1028px; height: 214px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 32px; height: 40px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout2.png" draggable="false" style="position: absolute; left: -205px; top: -102px; width: 1028px; height: 214px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></div><div class="gmnoprint" controlwidth="20" controlheight="39" style="position: absolute; left: 29px; top: 130px;"><div style="width: 20px; height: 39px; overflow: hidden; position: absolute;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt3.png" draggable="false" style="position: absolute; left: -39px; top: -401px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div title="Aumentar o zoom" style="position: absolute; left: 0px; top: 2px; width: 20px; height: 17px; cursor: pointer;"></div><div title="Diminuir o zoom" style="position: absolute; left: 0px; top: 19px; width: 20px; height: 17px; cursor: pointer;"></div></div></div><div class="gmnoprint" style="margin: 5px; z-index: 0; position: absolute; cursor: pointer; right: 0px; top: 0px;"><div class="gm-style-mtc" style="float: left;"><div draggable="false" title="Mostrar mapa de ruas" style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 1px 6px; border-bottom-left-radius: 2px; border-top-left-radius: 2px; -webkit-background-clip: padding-box; border: 1px solid rgba(0, 0, 0, 0.14902); -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; min-width: 29px; font-weight: 500; background-color: rgb(255, 255, 255); background-clip: padding-box;">Mapa</div><div style="z-index: -1; padding-top: 2px; -webkit-background-clip: padding-box; border-width: 0px 1px 1px; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-right-color: rgba(0, 0, 0, 0.14902); border-bottom-color: rgba(0, 0, 0, 0.14902); border-left-color: rgba(0, 0, 0, 0.14902); -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; position: absolute; left: 0px; top: 20px; text-align: left; display: none; background-color: white; background-clip: padding-box;"><div draggable="false" title="Mostrar mapa de ruas com terreno" style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 3px 8px 3px 3px; direction: ltr; text-align: left; white-space: nowrap; background-color: rgb(255, 255, 255);"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; border: 1px solid rgb(198, 198, 198); border-top-left-radius: 1px; border-top-right-radius: 1px; border-bottom-right-radius: 1px; border-bottom-left-radius: 1px; width: 13px; height: 13px; vertical-align: middle; background-color: rgb(255, 255, 255);"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden; display: none;"><img src="http://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">Terreno</label></div></div></div><div class="gm-style-mtc" style="float: left;"><div draggable="false" title="Mostrar imagens de satélite" style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(86, 86, 86); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 1px 6px; border-bottom-right-radius: 2px; border-top-right-radius: 2px; -webkit-background-clip: padding-box; border-width: 1px 1px 1px 0px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-top-color: rgba(0, 0, 0, 0.14902); border-right-color: rgba(0, 0, 0, 0.14902); border-bottom-color: rgba(0, 0, 0, 0.14902); -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; min-width: 36px; background-color: rgb(255, 255, 255); background-clip: padding-box;">Satélite</div><div style="z-index: -1; padding-top: 2px; -webkit-background-clip: padding-box; border-width: 0px 1px 1px; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-right-color: rgba(0, 0, 0, 0.14902); border-bottom-color: rgba(0, 0, 0, 0.14902); border-left-color: rgba(0, 0, 0, 0.14902); -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; position: absolute; right: 0px; top: 20px; text-align: left; display: none; background-color: white; background-clip: padding-box;"><div draggable="false" title="Aumentar o zoom para a visualização de 45 graus" style="color: rgb(184, 184, 184); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 3px 8px 3px 3px; direction: ltr; text-align: left; white-space: nowrap; display: none; background-color: rgb(255, 255, 255);"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; border: 1px solid rgb(241, 241, 241); border-top-left-radius: 1px; border-top-right-radius: 1px; border-bottom-right-radius: 1px; border-bottom-left-radius: 1px; width: 13px; height: 13px; vertical-align: middle; background-color: rgb(255, 255, 255);"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden; display: none;"><img src="http://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">45°</label></div><div draggable="false" title="Mostrar imagens com nomes de rua" style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 3px 8px 3px 3px; direction: ltr; text-align: left; white-space: nowrap; background-color: rgb(255, 255, 255);"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; border: 1px solid rgb(198, 198, 198); border-top-left-radius: 1px; border-top-right-radius: 1px; border-bottom-right-radius: 1px; border-bottom-left-radius: 1px; width: 13px; height: 13px; vertical-align: middle; background-color: rgb(255, 255, 255);"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden;"><img src="http://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">Marcadores</label></div></div></div></div><div draggable="false" class="gm-style-cc" style="-webkit-user-select: none; position: absolute; right: 193px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><span>500 m&nbsp;</span><div style="position: relative; display: inline-block; height: 8px; bottom: -1px; width: 66px;"><div style="width: 100%; height: 4px; position: absolute; bottom: 0px; left: 0px; background-color: rgb(255, 255, 255);"></div><div style="position: absolute; left: 0px; top: 0px; width: 4px; height: 8px; background-color: rgb(255, 255, 255);"></div><div style="width: 4px; height: 8px; position: absolute; bottom: 0px; right: 0px; background-color: rgb(255, 255, 255);"></div><div style="position: absolute; height: 2px; bottom: 1px; right: 1px; left: 1px; background-color: rgb(102, 102, 102);"></div><div style="position: absolute; left: 1px; top: 1px; width: 2px; height: 6px; background-color: rgb(102, 102, 102);"></div><div style="width: 2px; height: 6px; position: absolute; bottom: 1px; right: 1px; background-color: rgb(102, 102, 102);"></div></div></div></div></div></div>
                     <div class="panel-body bg-purple">
                        <div class="row row-table">
                           <div class="col-xs-6">
                              <div class="h2 m0">Meet Us!</div>
                           </div>
                           <div class="col-xs-1">
                              <em class="fa fa-map-marker fa-3x"></em>
                           </div>
                           <div class="col-xs-5">
                              <p class="m0">Street 123</p>
                              <p class="m0">Melbourne, Australia</p>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- END widget-->
               </div>
               
               <div class="col-lg-13 searchDiarist">
               	   <em class="fa fa-search sd"></em>
	               <div class="form-group has-feedback">
	                     <input ng-model="searchDiarista" ng-change="filter()" id="exampleInputPassword1" type="text" placeholder="Digite o termo da busca" class="form-control">
	               </div>
               </div>
               
               <div class="panel widget col-lg-12" ng-repeat="diarista in filtered = (diaristas | filter:searchDiarista) | startFrom:(currentPage-1)*entryLimit | limitTo:entryLimit">
	               <div class="panel-body listDiarista">
	                        <div class="media mt0">
	                           <div class="pull-left">
	                              <img src="/cleanUp/resources/assets/img/user/05.jpg" alt="Avatar" width="60" height="60" class="img-thumbnail img-circle">
	                           </div>
	                           <div class="media-body">
	                              <div class="media-heading masterdiarista">
	                                 <h3 class="mt0 ng-binding"> {{diarista.nome}}</h3>
	                                 <ul class="list-unstyled">
	                                    <li class="mb-sm ng-binding">
	                                       <em class="fa fa-map-marker fa-fw"></em> {{diarista.cidade.nomeCidade}}</li>
	                                    
	                                    <li class="mb-sm ng-binding">
	                                       <a href="" class="has-submenu">
	                                       <em class="fa fa-star fa-2x"></em></a></li>	                                    
	                                 </ul>
	                              </div>
	                           	  
	                           	   <div class="media-heading masterdiarista">
	                                 <ul class="list-unstyled">
	                                    <li class="mb-sm ng-binding espec" ng-repeat="especialidade in diarista.especialidades">
	                                       <em class="fa fa-map-marker fa-fw"></em>{{especialidade.nomeEspecialidade}}
	                                    </li>	                                    	
	                                 </ul>
	                                 <div class="btn btn-oval btn-success pull-right" ng-click="selectedDiarista(diarista);">
	                                 <input type="hidden" value="{{diarista.codigo}}" />
											<i class="fa fa-check"></i>
									 </div>									 
									 <div class="col-xs-4" ng-show="diarista.mediaDiarista > 0">
			                              <p class="m0 h3 ng-binding"> {{diarista.mediaDiarista | number:1}}</p>                              
			                              <p class="m0 text-muted">Nota</p>
			                         </div>
			                         <div class="col-xs-4" ng-show="diarista.mediaDiarista == 0">
			                              <p class="m0 text-muted">Não Avaliada</p>
			                         </div>
	                              </div>
	                           </div>
	                        </div>
	                 </div>
               </div>
               
               <div class="col-md-12" ng-show="filteredItems > 4">    
				            <pagination class="pagination" page="currentPage" on-select-page="setPage(page)" total-items="filteredItems" 
							items-per-page="entryLimit" ng-model="currentPage" ng-change="pageChanged(currentPage)" 
							max-size="maxSize" class="pagination-sm" boundary-links="true" rotate="false" num-pages="numPages"></pagination>
				        </div>
               </section>
               <!-- END dashboard main content-->
               
            </div>
            
            
            
         </div>
         <!-- END Page content-->
         <!-- START Page footer-->
         <footer>&copy; 2014 - Wintermin</footer>
         <!-- END Page Footer-->
      </section>
      <!-- END Main section-->
    
   <!-- START modal-->
		<div id="myModal" tabindex="-1" role="dialog" aria-labelledby="myMapModalLabel" aria-hidden="true" class="modal fade">
		      <div class="modal-dialog">
		         <div class="modal-content">
		            <div class="modal-header">
		               <button ng-click="reset()" type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
		               <div class="pull-left">
	                              <img src="/cleanUp/resources/assets/img/user/05.jpg" alt="Avatar" width="30" height="30" class="img-thumbnail img-circle">
	                           </div>
		               <h4 id="myMapModalLabel" class="modal-title">&nbsp Contactar {{diarista.nome}}</h4>
		            </div>
		            <form name="servicoForm" method="post">
		            <div class="modal-body">		               
		               <input type="hidden" required ng-model="diarista.codigo" name="id"
						value="{{diarista.codigo}}" />				

						<div class="modalBody">
							<div class="inputsCliente">
								<div class="form-group ">
								       	<label for="datePicker">Data do serviço</label>
								       	<div id="datePicker" data-pick-time="false" class="datetimepicker input-group date mb-lg">
					                    	<input id="dp" placeholder="dd/MM/yyyy" ng-model="data" type="text" class="form-control" required>
					                        <span class="input-group-addon">
					                        	<span class="fa-calendar fa"></span>
					                        </span>
					                	</div>		
								</div>		
								<div class="form-group">
										<label for="desc">Descrição do serviço, quantidade de
											cômodos e espaço físico.</label>
										<textarea ng-model="descricao" required class="form-control" rows="3"></textarea>
								</div>
								
								<div class="input-group">
	                                 <input id="txtEndereco" type="text" class="form-control" ng-model="logradouro" placeholder="Digite um endereço e confirme no botão (+)">
	                                 <span class="input-group-btn">
	                                    <button type="button" class="btn btn-success" ng-click="addEndereco()"><i class="fa fa-plus"></i></button>
	                                 </span>
                              	</div>
																									
									<div class="input-group" ng-show="enderecos.length > 0" ng-repeat="endereco in enderecos" class="item-unchecked">
		                                 <input disabled type="text" class="form-control" value="{{endereco.logradouro}}">
		                                 <span class="input-group-btn">
		                                    <button type="button" class="btn btn-danger" ng-click="removeEndereco($index)"><i class="fa fa-times"></i></button>
		                                 </span>
                              		</div>
		
								<div hidden id="mapa"></div>
		
								<input type="hidden" ng-model="lat" id="txtLatitude"
									name="txtLatitude" /> <input type="hidden" ng-model="lng"
									id="txtLongitude" name="txtLongitude" />
							</div>
						</div>
						
		            </div>
		            <div class="modal-footer">
			            <div class="alert" ng-show="arrayEnd">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<strong>Obrigatório!</strong>{{msg}}
						</div>
						<button type="submit" class="btn btn-primary"
							ng-click="enviarServico(servicoForm)">Enviar
						</button>
		            </div>		            
		            </form>
		         </div>
		      </div>
		   </div>		   
   <!-- END modal-->
   <!-- Main vendor Scripts-->
   <script src="<c:url value='/resources/assets/jquery/jquery.min.js' />"></script>
   <script src="<c:url value='/resources/js/js-template/jquery.mask.js' />"></script>
   <script src="<c:url value='/resources/assets/bootstrap/js/bootstrap.min.js' />"></script>
   <script src="<c:url value='/resources/js/jquery-ui.custom.mim.js' />"></script>
   <script src="<c:url value='/resources/js/bootbox.min.js' />"></script>
   
   <!-- Plugins-->
   <script src="<c:url value='/resources/assets/chosen/chosen.jquery.min.js' />"></script>
   <script src="<c:url value='/resources/assets/slider/js/bootstrap-slider.js' />"></script>
   <script src="<c:url value='/resources/assets/filestyle/bootstrap-filestyle.min.js' />"></script>
   
   
   <!-- Animo-->
   <script src="<c:url value='/resources/assets/animo/animo.min.js' />"></script>
   
   <!-- Sparklines-->
   <script src="<c:url value='/resources/assets/sparklines/jquery.sparkline.min.js' />"></script>
   
   <!-- Slimscroll-->
   <script src="<c:url value='/resources/assets/slimscroll/jquery.slimscroll.min.js' />"></script>
   
   <!-- Store + JSON-->
   <script src="<c:url value='/resources/assets/store/store+json2.min.js' />"></script>
   
   <!-- Classyloader-->
   <script src="<c:url value='/resources/assets/classyloader/js/jquery.classyloader.min.js' />"></script>
   
   <!-- BootstrapDatepicker-->
   <script src="<c:url value='/resources/assets/moment/min/moment-with-langs.min.js' />"></script>
   <script src="<c:url value='/resources/assets/datetimepicker/js/bootstrap-datetimepicker.min.js' />"></script>
   
   <script src="<c:url value='/resources/js/validacaoDeCamposCadastro.js' />"></script>
   
   <!-- START Page Custom Script-->
   <!--  Flot Charts-->
   <script src="<c:url value='/resources/assets/flot/jquery.flot.min.js' />"></script>
   <script src="<c:url value='/resources/assets/flot/jquery.flot.tooltip.min.js' />"></script>
   <script src="<c:url value='/resources/assets/flot/jquery.flot.resize.min.js' />"></script>
   <script src="<c:url value='/resources/assets/flot/jquery.flot.pie.min.js' />"></script>
   <script src="<c:url value='/resources/assets/flot/jquery.flot.time.min.js' />"></script>
   <script src="<c:url value='/resources/assets/flot/jquery.flot.categories.min.js' />"></script>
   <!--[if lt IE 8]><script src="js/excanvas.min.js"></script><![endif]-->
   <!-- END Page Custom Script-->
   
   <script src="<c:url value='/resources/assets/gmap/jquery.gmap.min.js' />"></script>
   <!-- App Main-->
   <script src="<c:url value='/resources/assets/js/app.js' />"></script>
   <!-- END Scripts-->      

   <script src="<c:url value='/protected/controller/clienteController.js' />"></script> 