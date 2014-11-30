<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- START Main section-->
      <section>
         
         <!-- START Page content-->
         <div class="main-content">
            <h3>Histórico de serviços</h3>
            
            <div class="alert alert-info" ng-show="historico.length == 0">
	              		<h3>Sem histórico<br>
						     <h5>Até o presente momento não foram registradas atividades de serviço.</h5>
					    </h3>
	        </div> 
            
            <!-- START timeline-->
            <ul class="timeline" ng-show="historico.length > 0">
               <li data-datetime="Aceitos e Concluidos &nbsp &nbsp &nbsp &nbsp &nbsp | &nbsp &nbsp Pendentes e Cancelados" class="timeline-separator"></li>
               <!-- START timeline item-->
               <li ng-repeat="hist in historico | filter:searchString" class="{{hist.classeTimeline}}" id="{{hist.codServico}}">
                  
				  <!-- timeline-badge ACEITO -->
                  <div class="timeline-badge primary" ng-show="hist.status == 'ACEITO'">
                     <em class="fa fa-check-square-o"></em>
                  </div>
                  
                  <!-- timeline-badge CONCLUIDO -->
                  <div class="timeline-badge success"  ng-show="hist.status == 'CONCLUIDO'">
                     <em class="fa fa-check"></em>
                  </div>
                  
                  <!-- timeline-badge CANCELAR -->
                  <div class="timeline-badge danger" ng-show="hist.status == 'CANCELAR'">
                     <em class="fa fa-times"></em>
                  </div>
                  
                  <!-- timeline-badge PENDENTE -->
                  <div class="timeline-badge warning" ng-show="hist.status == 'PENDENTE'">
                     <em class="fa fa-clock-o"></em>
                  </div>
                  
                  <div class="timeline-date">
                     <time datetime="{{hist.dataAlteracao | date:'dd/MM/yyyy - HH:mm'}}"></time></br>
                     <small>Data / Hora de alteração</small>
                  </div>
                  <div class="timeline-panel">
                     <div class="{{hist.classePopover}}">
                        <div class="arrow"></div>
                        <h3 class="popover-title">Código: {{hist.codServico}}</h3>
                        <div class="popover-content">
                           <p>Diarista: {{hist.diarista.nome}}
                              <br>
                              <small>Endereço: {{hist.endereco.logradouro}}</small></br>
                              <small>Status: {{hist.status}}</small>
                           </p>
                        </div>
                     </div>
                  </div>
               </li>               
            </ul>
            <!-- END timeline-->
         </div>
         <!-- END Page content-->
         <!-- START Page footer-->
         <footer>&copy; 2014 - Wintermin</footer>
         <!-- END Page Footer-->
         
      </section>
      <!-- END Main section-->     
   
   <!-- Main vendor Scripts-->
   <script src="<c:url value='/resources/assets/jquery/jquery.min.js' />"></script>
   <script src="<c:url value='/resources/assets/bootstrap/js/bootstrap.min.js' />"></script>
   <script src="<c:url value='/resources/js/bootbox.min.js' />"></script>
   <script src="<c:url value='/resources/js/jquery-ui.custom.mim.js' />"></script>
   
   <!-- Plugins-->
   <script src="<c:url value='/resources/assets/chosen/chosen.jquery.min.js' />"></script>
   <script src="<c:url value='/resources/assets/slider/js/bootstrap-slider.js' />"></script>
   <script src="<c:url value='/resources/assets/filestyle/bootstrap-filestyle.min.js' />"></script>
   
   <!-- BootstrapDatepicker-->
   <script src="<c:url value='/resources/assets/moment/min/moment-with-langs.min.js' />"></script>
   <script src="<c:url value='/resources/assets/datetimepicker/js/bootstrap-datetimepicker.min.js' />"></script>
   
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
   
   <script src="<c:url value='/resources/rate/jquery.raty.js' />"></script>
   
   <script src="<c:url value='/resources/assets/jloader/js/jquery.oLoader.min.js' />" ></script>
   
   <!-- App Main-->
   <script src="<c:url value='/resources/assets/js/app.js' />"></script>
   <!-- END Scripts-->      
   <script src="<c:url value='/resources/js/elif.js' />"></script>

   <script src="<c:url value='/protected/controller/clienteController.js' />"></script>   