<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="main" ng-controller="clienteController">

	<!-- 	MODAL --------------------------------------------------------------------------->
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
	<!-- 	MODAL END-->

	<div class="main-inner">
		<div class="container">

			<div class="row">
				<div class="span6">
					<!-- /widget -->
					<div class="widget widget-nopad">
						<div class="widget-header">
							<i class="icon-list-alt"></i>
							<h3>Diaristas</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content">
							<ul class="news-items">
								<li ng-repeat="diarista in diaristas">
									<div class="news-item-date">
										<a href="#" class="avatar"><img
											src="<c:url value='/resources/img/message_avatar1.png'  />" /></a>
									</div>
									<div class="news-item-detail">
										<a href="http://www.egrappler.com/thursday-roundup-40/"
											class="news-item-title" target="_blank">{{diarista.nome}}</a>
										<p hidden class="news-item-preview">
											<span>telefone: </span>{{diarista.telefone}}
										</p>
										<p class="news-item-preview">
											<span>cidade: </span>{{diarista.cidade.nomeCidade}}
										</p>
										<div class="news-item-preview" id="listaespecialidades">Especialidades:</div>
										<div class="news-item-preview" id="listaespecialidades"
											ng-repeat="esp in diarista.especialidades">
											<span>{{esp.nomeEspecialidade}}</span>
										</div>
									</div>
									<div class="news-item-date">
										<input type="hidden" value="{{diarista.codigo}}" /> <a
											href="#modal" class="btn btn-small btn-success"
											data-toggle="modal" data-target="#myModal"><i
											class="btn-icon-only icon-ok"
											ng-click="selectedDiarista(diarista);"> </i></a> <span
											class="news-item-month">Selecionar</span>
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
						<div class="widget-header">
							<i class="icon-bookmark"></i>
							<h3>Funcionalidades</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content">
							<div class="shortcuts">
								<a href="javascript:;" class="shortcut"><i
									class="shortcut-icon icon-list-alt"></i><span
									class="shortcut-label">Apps</span> </a><a href="javascript:;"
									class="shortcut"><i class="shortcut-icon icon-bookmark"></i><span
									class="shortcut-label">Bookmarks</span> </a><a href="javascript:;"
									class="shortcut"><i class="shortcut-icon icon-signal"></i>
									<span class="shortcut-label">Reports</span> </a><a
									href="javascript:;" class="shortcut"> <i
									class="shortcut-icon icon-comment"></i><span
									class="shortcut-label">Comments</span>
								</a><a href="javascript:;" class="shortcut"><i
									class="shortcut-icon icon-user"></i><span
									class="shortcut-label">Users</span> </a><a href="javascript:;"
									class="shortcut"><i class="shortcut-icon icon-file"></i><span
									class="shortcut-label">Notes</span> </a><a href="javascript:;"
									class="shortcut"><i class="shortcut-icon icon-picture"></i>
									<span class="shortcut-label">Photos</span> </a><a
									href="javascript:;" class="shortcut"> <i
									class="shortcut-icon icon-tag"></i><span class="shortcut-label">Tags</span>
								</a>
							</div>
							<!-- /shortcuts -->
						</div>
						<!-- /widget-content -->
					</div>


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
					<h4>About Free Admin Template</h4>
					<ul>
						<li><a href="javascript:;">EGrappler.com</a></li>
						<li><a href="javascript:;">Web Development Resources</a></li>
						<li><a href="javascript:;">Responsive HTML5 Portfolio
								Templates</a></li>
						<li><a href="javascript:;">Free Resources and Scripts</a></li>
					</ul>
				</div>
				<!-- /span3 -->
				<div class="span3">
					<h4>Support</h4>
					<ul>
						<li><a href="javascript:;">Frequently Asked Questions</a></li>
						<li><a href="javascript:;">Ask a Question</a></li>
						<li><a href="javascript:;">Video Tutorial</a></li>
						<li><a href="javascript:;">Feedback</a></li>
					</ul>
				</div>
				<!-- /span3 -->
				<div class="span3">
					<h4>Something Legal</h4>
					<ul>
						<li><a href="javascript:;">Read License</a></li>
						<li><a href="javascript:;">Terms of Use</a></li>
						<li><a href="javascript:;">Privacy Policy</a></li>
					</ul>
				</div>
				<!-- /span3 -->
				<div class="span3">
					<h4>Open Source jQuery Plugins</h4>
					<ul>
						<li><a href="http://www.egrappler.com">Open Source jQuery
								Plugins</a></li>
						<li><a href="http://www.egrappler.com;">HTML5 Responsive
								Tempaltes</a></li>
						<li><a href="http://www.egrappler.com;">Free Contact Form
								Plugin</a></li>
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
				<div class="span12">
					&copy; 2013 <a href="http://www.egrappler.com/">Bootstrap
						Responsive Admin Template</a>.
				</div>
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
<!-- Placed at the end of the document so the pages load faster -->
<!-- jQuery Version 1.11.0 -->
<%-- <script src="<c:url value='/resources/js/jquery.min.js' />"></script> --%>
<script
	src="<c:url value='/resources/js/js-template/excanvas.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/chart.min.js' />"></script>

<!-- Caixa de informação -->
<script src="<c:url value='/resources/js/js-template/infobox.js' />"></script>

<!-- Agrupamento dos marcadores -->
<script
	src="<c:url value='/resources/js/js-template/markerclusterer.js' />"></script>
<script src="<c:url value='/resources/js/jquery-1.7.2.min.js' />"></script>
<script src="<c:url value='/resources/js/jquery-ui.custom.mim.js' />"></script>
<script src="<c:url value='/resources/js/js-template/bootstrap.js' />"></script>
<script src="<c:url value='/resources/js/bootbox.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/signin.js' />"></script>
<script
	src="<c:url value='/resources/js/js-template/jquery.mask.min.js' />"></script>
<script src="<c:url value='/resources/js/js-template/jquery.mask.js' />"></script>
<script src="<c:url value='/resources/js/checklist-model.js' />"></script>
<script
	src="<c:url value='/protected/controller/clienteController.js' />"></script>
<script
	src="<c:url value='/resources/js/angular-xeditable-0.1.8/js/xeditable.min.js' />"></script>
<script
	src="<c:url value='/resources/js/validacaoDeCamposCadastro.js' />"></script>

