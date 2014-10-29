<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div ng-controller="diaristaController">

<div class="main">
  <div class="main-inner">
    <div class="container">
      <div class="row">
        <div class="span6">
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Status Diário</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="widget big-stats-container">
                <div class="widget-content">
                  <h6 class="bigstats">A fully responsive premium quality admin template built on Twitter Bootstrap by <a href="http://www.egrappler.com" target="_blank">EGrappler.com</a>.  These are some dummy lines to fill the area.</h6>
                  <div id="big_stats" class="cf">
                    <div class="stat"> <i class="icon-anchor"></i> <span class="value">851</span> </div>
                    <!-- .stat -->
                    
                    <div class="stat"> <i class="icon-thumbs-up-alt"></i> <span class="value">423</span> </div>
                    <!-- .stat -->
                    
                    <div class="stat"> <i class="icon-twitter-sign"></i> <span class="value">922</span> </div>
                    <!-- .stat -->
                    
                    <div class="stat"> <i class="icon-bullhorn"></i> <span class="value">25%</span> </div>
                    <!-- .stat --> 
                  </div>
                </div>
                <!-- /widget-content --> 
                
              </div>
            </div>
          </div>
          <!-- /widget -->
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Agenda</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div id='calendar'>
              </div>
            </div>
            <!-- /widget-content --> 
          </div>
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Histórico de atividades</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <ul class="news-items">
                <li>
                  
                  <div class="news-item-date"> <span class="news-item-day">29</span> <span class="news-item-month">Aug</span> </div>
                  <div class="news-item-detail"> <a href="http://www.egrappler.com/thursday-roundup-40/" class="news-item-title" target="_blank">Thursday Roundup # 40</a>
                    <p class="news-item-preview"> This is our web design and development news series where we share our favorite design/development related articles, resources, tutorials and awesome freebies. </p>
                  </div>
                  
                </li>
                <li>
                  
                  <div class="news-item-date"> <span class="news-item-day">15</span> <span class="news-item-month">Jun</span> </div>
                  <div class="news-item-detail"> <a href="http://www.egrappler.com/retina-ready-responsive-app-landing-page-website-template-app-landing/" class="news-item-title" target="_blank">Retina Ready Responsive App Landing Page Website Template – App Landing</a>
                    <p class="news-item-preview"> App Landing is a retina ready responsive app landing page website template perfect for software and application developers and small business owners looking to promote their iPhone, iPad, Android Apps and software products.</p>
                  </div>
                  
                </li>
                <li>
                  
                  <div class="news-item-date"> <span class="news-item-day">29</span> <span class="news-item-month">Oct</span> </div>
                  <div class="news-item-detail"> <a href="http://www.egrappler.com/open-source-jquery-php-ajax-contact-form-templates-with-captcha-formify/" class="news-item-title" target="_blank">Open Source jQuery PHP Ajax Contact Form Templates With Captcha: Formify</a>
                    <p class="news-item-preview"> Formify is a contribution to lessen the pain of creating contact forms. The collection contains six different forms that are commonly used. These open source contact forms can be customized as well to suit the need for your website/application.</p>
                  </div>
                  
                </li>
              </ul>
            </div>
            <!-- /widget-content --> 
          </div>
        <!-- /widget --> 
        </div>
        <!-- /span6 -->
        <div class="span6">
          <div class="widget">
            <div class="widget-header"> <i class="icon-bookmark"></i>
              <h3>Funcionalidades</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="shortcuts"> 
              	<a href="/cleanUp/protected/diarista/servicos" class="shortcut"><i class="shortcut-icon icon-list-alt" ng-click="listarServicos();"></i><span class="shortcut-label">Serviços</span> </a>
                <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-bookmark"></i><span class="shortcut-label">Bookmarks</span> </a>
                <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-signal"></i> <span class="shortcut-label">Reports</span> </a>
                <a href="javascript:;" class="shortcut"> <i class="shortcut-icon icon-comment"></i><span class="shortcut-label">Comments</span> </a>
                <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-user"></i><span class="shortcut-label">Users</span> </a>
                <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-file"></i><span class="shortcut-label">Notes</span> </a><a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-picture"></i> <span class="shortcut-label">Photos</span> </a><a href="javascript:;" class="shortcut"> <i class="shortcut-icon icon-tag"></i><span class="shortcut-label">Tags</span> </a> </div>
              <!-- /shortcuts --> 
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
          <div class="widget">
            <div class="widget-header"> <i class="icon-signal"></i>
              <h3> Area Chart Example</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <canvas id="area-chart" class="chart-holder" height="250" width="538"> </canvas>
              <!-- /area-chart --> 
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
          <div class="widget widget-table action-table">
            <div class="widget-header"> <i class="icon-th-list"></i>
              <h3>A Table Example</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
                    <th> Free Resource </th>
                    <th> Download</th>
                    <th class="td-actions"> </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td> Fresh Web Development Resources </td>
                    <td> http://www.egrappler.com/ </td>
                    <td class="td-actions"><a href="javascript:;" class="btn btn-small btn-success"><i class="btn-icon-only icon-ok"> </i></a><a href="javascript:;" class="btn btn-danger btn-small"><i class="btn-icon-only icon-remove"> </i></a></td>
                  </tr>
                  <tr>
                    <td> Fresh Web Development Resources </td>
                    <td> http://www.egrappler.com/ </td>
                    <td class="td-actions"><a href="javascript:;" class="btn btn-small btn-success"><i class="btn-icon-only icon-ok"> </i></a><a href="javascript:;" class="btn btn-danger btn-small"><i class="btn-icon-only icon-remove"> </i></a></td>
                  </tr>
                  <tr>
                    <td> Fresh Web Development Resources </td>
                    <td> http://www.egrappler.com/ </td>
                    <td class="td-actions"><a href="javascript:;" class="btn btn-small btn-success"><i class="btn-icon-only icon-ok"> </i></a><a href="javascript:;" class="btn btn-danger btn-small"><i class="btn-icon-only icon-remove"> </i></a></td>
                  </tr>
                  <tr>
                    <td> Fresh Web Development Resources </td>
                    <td> http://www.egrappler.com/ </td>
                    <td class="td-actions"><a href="javascript:;" class="btn btn-small btn-success"><i class="btn-icon-only icon-ok"> </i></a><a href="javascript:;" class="btn btn-danger btn-small"><i class="btn-icon-only icon-remove"> </i></a></td>
                  </tr>
                  <tr>
                    <td> Fresh Web Development Resources </td>
                    <td> http://www.egrappler.com/ </td>
                    <td class="td-actions"><a href="javascript:;" class="btn btn-small btn-success"><i class="btn-icon-only icon-ok"> </i></a><a href="javascript:;" class="btn btn-danger btn-small"><i class="btn-icon-only icon-remove"> </i></a></td>
                  </tr>
                
                </tbody>
              </table>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget --> 
          
          <!-- /widget -->
        </div>
        <!-- /span6 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /main-inner --> 
</div>
<!-- /main -->
<div class="extra">
  <div class="extra-inner">
    <div class="container">
      <div class="row">
                    <div class="span3">
                        <h4>
                            About Free Admin Template</h4>
                        <ul>
                            <li><a href="javascript:;">EGrappler.com</a></li>
                            <li><a href="javascript:;">Web Development Resources</a></li>
                            <li><a href="javascript:;">Responsive HTML5 Portfolio Templates</a></li>
                            <li><a href="javascript:;">Free Resources and Scripts</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Support</h4>
                        <ul>
                            <li><a href="javascript:;">Frequently Asked Questions</a></li>
                            <li><a href="javascript:;">Ask a Question</a></li>
                            <li><a href="javascript:;">Video Tutorial</a></li>
                            <li><a href="javascript:;">Feedback</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Something Legal</h4>
                        <ul>
                            <li><a href="javascript:;">Read License</a></li>
                            <li><a href="javascript:;">Terms of Use</a></li>
                            <li><a href="javascript:;">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Open Source jQuery Plugins</h4>
                        <ul>
                            <li><a href="http://www.egrappler.com">Open Source jQuery Plugins</a></li>
                            <li><a href="http://www.egrappler.com;">HTML5 Responsive Tempaltes</a></li>
                            <li><a href="http://www.egrappler.com;">Free Contact Form Plugin</a></li>
                            <li><a href="http://www.egrappler.com;">Flat UI PSD</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /extra-inner --> 
</div>
<!-- /extra -->
<div class="footer">
  <div class="footer-inner">
    <div class="container">
      <div class="row">
        <div class="span12"> &copy; 2013 <a href="http://www.egrappler.com/">Bootstrap Responsive Admin Template</a>. </div>
        <!-- /span12 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /footer-inner --> 
</div>
<!-- /footer --> 
<!-- Le javascript
================================================== -->

<!-- MODAL -->

<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true" ng-click="reset()">×</button>
			<h3 id="myModalLabel">Contactar {{diarista.nome}}</h3>
		</div>
		<form name="servicoForm" method="post">
			<div class="modal-body">
				<input type="hidden" required ng-model="diarista.codigo" name="id"
					value="{{diarista.codigo}}" />

				<div class="pull-left">
					<div class="inputsCliente">
						<div class="form-group">
							<label for="date">Data do Serviço</label> <input ng-model="data"
								type="date" id="date" name="input" placeholder="dd-MM-yyyy"
								min="10-07-2014" required />
						</div>

						<div class="form-group">
							<label for="desc">Descrição do serviço, quantidade de
								cômodos e espaço físico.</label>
							<textarea id="desc" ng-model="descricao" required></textarea>
						</div>

						<label for="desc">Endereço</label>
						<div class="enderecos input-append">
							<p class="campoEnde">
								<input ng-model="logradouro"
									placeholder="Digite um endereço e confirme no botão (+)"
									class="txtEndereco span2 m-wrap" type="text">
								<button class=" btn btn-success" ng-click="addEndereco()"
									type="button">+</button>
							</p>
						</div>

						<div ng-show="enderecos.length > 0" class="input-group">
							<table style="width: 520px;"
								class="table table-striped table-hover table-condensed">
								<tr ng-repeat="endereco in enderecos" class="item-unchecked">
									<td style="width: 470px;">{{endereco.logradouro}}</td>
									<td>
										<button class="btn btn-danger"
											ng-click="removeEndereco($index)">x</button>
									</td>
								</tr>
							</table>
						</div>

						<div hidden id="mapa" style="height: 400px; width: 400px"></div>

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
					ng-click="enviarServico(servicoForm)">Enviar</button>
			</div>
		</form>
	</div>


<!-- END MODAL -->



</div> 
<!-- Placed at the end of the document so the pages load faster --> 
<!-- jQuery Version 1.11.0 -->    
<script src="<c:url value='/resources/js/jquery-1.7.2.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/excanvas.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/chart.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/bootstrap.js' />"></script>
<script src="<c:url value='/resources/js/full-calendar/fullcalendar.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/base.js' />"></script>
<script>     

        var lineChartData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
				{
				    fillColor: "rgba(220,220,220,0.5)",
				    strokeColor: "rgba(220,220,220,1)",
				    pointColor: "rgba(220,220,220,1)",
				    pointStrokeColor: "#fff",
				    data: [65, 59, 90, 81, 56, 55, 40]
				},
				{
				    fillColor: "rgba(151,187,205,0.5)",
				    strokeColor: "rgba(151,187,205,1)",
				    pointColor: "rgba(151,187,205,1)",
				    pointStrokeColor: "#fff",
				    data: [28, 48, 40, 19, 96, 27, 100]
				}
			]

        }

        var myLine = new Chart(document.getElementById("area-chart").getContext("2d")).Line(lineChartData);


        var barChartData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
				{
				    fillColor: "rgba(220,220,220,0.5)",
				    strokeColor: "rgba(220,220,220,1)",
				    data: [65, 59, 90, 81, 56, 55, 40]
				},
				{
				    fillColor: "rgba(151,187,205,0.5)",
				    strokeColor: "rgba(151,187,205,1)",
				    data: [28, 48, 40, 19, 96, 27, 100]
				}
			]

        }    

        $(document).ready(function() {
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        var calendar = $('#calendar').fullCalendar({
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
          },
          selectable: true,
          selectHelper: true,
          select: function(start, end, allDay) {
            var title = prompt('Event Title:');
            if (title) {
              calendar.fullCalendar('renderEvent',
                {
                  title: title,
                  start: start,
                  end: end,
                  allDay: allDay
                },
                true // make the event "stick"
              );
            }
            calendar.fullCalendar('unselect');
          },
          editable: true,
          events: [
            {
              title: 'All Day Event',
              start: new Date(y, m, 1)
            },
            {
              title: 'Long Event',
              start: new Date(y, m, d+5),
              end: new Date(y, m, d+7)
            },
            {
              id: 999,
              title: 'Repeating Event',
              start: new Date(y, m, d-3, 16, 0),
              allDay: false
            },
            {
              id: 999,
              title: 'Repeating Event',
              start: new Date(y, m, d+4, 16, 0),
              allDay: false
            },
            {
              title: 'Meeting',
              start: new Date(y, m, d, 10, 30),
              allDay: false
            },
            {
              title: 'Lunch',
              start: new Date(y, m, d, 12, 0),
              end: new Date(y, m, d, 14, 0),
              allDay: false
            },
            {
              title: 'Birthday Party',
              start: new Date(y, m, d+1, 19, 0),
              end: new Date(y, m, d+1, 22, 30),
              allDay: false
            },
            {
              title: 'EGrappler.com',
              start: new Date(y, m, 28),
              end: new Date(y, m, 29),
              url: 'http://EGrappler.com/'
            }
          ]
        });
      });
    </script><!-- /Calendar -->
    
    <script src="<c:url value='/protected/controller/diaristaController.js' />"></script>   
    <script src="<c:url value='/resources/js/bootbox.min.js' />"></script>  