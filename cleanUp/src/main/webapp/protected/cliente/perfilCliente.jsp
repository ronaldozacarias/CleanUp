<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- START Main section-->
      <section ng-controller="clienteController">
         
         <!-- START Page content-->
         <div id="mainCont" class="main-content">        
            
            <div class="row">
               <!-- START dashboard main content-->
               <section>
               
               	  <!-- START Page content-->
	         	  <div class="main-content col-md-13">
	         	  	  <div class="row">
		         	  	  <div class="col-lg-8">
				         	  <div class="pull-left">
		                           <img src="<c:url value='{{fotoUsuario}}'  />" alt="Avatar"  width="132" height="132" class="img-thumbnail img-circle"/>

		                      </div>
                      	  </div>
                      </div>              
                       </br>
					   <!--Painel -->
					  <div class="row">
					   <div class="col-lg-13">
		                  <!-- START panel-->
		                  <div class="panel panel-default">
		                     <div class="panel-heading">
		                     	<h3 class="mt0">Perfil do usuário</h3>		                     	
		                     </div>
		                     <div class="panel-body">
		                        <!-- Nav tabs -->
		                        <ul class="nav nav-pills">
		                           <li class="active"><a href="#dadosCadastrais" data-toggle="tab"><em class="fa fa-user">&nbsp&nbsp</em>Dados cadastrais</a>
		                           </li>
		                           <li class="" ng-show="edit"><a href="#avatar" data-toggle="tab"><em class="fa fa-picture-o">&nbsp&nbsp</em>Avatar</a>
		                           </li>
		                        </ul>
		                        <!-- Tab panes -->
		                        <div class="tab-content">
		                           <div id="dadosCadastrais" class="tab-pane fade active in">
		                              	
		                              	<div class="panel-body" ng-show="edit == false" >
		                              		
		                              		<div class="col-md-13">
		                              			 <h4 ng-hide="edit == true">{{clienteVO.nome}}</h4>
		                              			 </br>
								                  <div class="form-group has-feedback col-md-5">
								                     <label class="control-label"><em class="fa fa-credit-card fa-fw"></em>&nbsp&nbsp{{clienteVO.cpf}}</label>								                     						                     
								                  </div>
								                  <div class="form-group has-feedback col-md-5">
								                     <label class="control-label"><em class="fa fa-phone fa-fw"></em>&nbsp&nbsp{{clienteVO.telefone}}</label>								                     
								                  </div>
								                  <div class="form-group has-feedback col-md-5">
								                     <label class="control-label"><em class="fa fa-map-marker fa-fw"></em>&nbsp&nbsp{{clienteVO.cidade.nomeCidade}}</label>								                     
								                  </div>
								                  <div class="form-group has-feedback col-md-5">
								                  	 <label class="control-label"><em class="fa fa-envelope fa-fw"></em>&nbsp&nbsp{{clienteVO.email}}</label>								                     
								                  </div>						                          
               								   </div>		                              		
		                              	</div>
		                            	<div class="panel-body" ng-show="edit">
               								<form name="editPerfil">
               								   <div class="col-md-13">
               								 	 <div class="form-group has-feedback col-md-6">
               								 	     <label class="control-label">Nome</label>
								                     <input id="signupInputEmail1" type="text" class="form-control" ng-model="clienteVO.nome" required="required" pattern=".{4,}">
								                  </div>
								                  <div class="form-group has-feedback col-md-6">
								                     <label class="control-label">Telefone</label>
								                     <input id="tel" type="text" class="form-control" ng-model="clienteVO.telefone" required="required" pattern=".{13,}" maxlength="13">
								                  </div>
								                  <div class="form-group has-feedback col-md-6">
								                     <label class="control-label">Cidade</label>
								                     <input id="signupInputRePassword1" type="text" placeholder="Cidade" class="form-control" ng-model="selected" typeahead="cidade as cidade.nomeCidade for cidade in cidades | filter:$viewValue | limitTo:8">
								                  </div>
								                  <div class="form-group has-feedback col-md-6">
								                  	 <label class="control-label">Email</label>
								                     <input id="signupInputRePassword1"  type="text" class="form-control" ng-model="clienteVO.email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>
								                  </div>								                  
								                  <div class="form-group has-feedback col-md-6">
								                  	 <label class="control-label">Senha</label>
								                     <input ng-model="clienteVO.senha" id="signupInputRePassword1" type="password" placeholder="Senha" class="form-control" pattern=".{8,}" maxlength="14" required>
								                  </div>						                          
               								   </div>
               								   <div class="col-md-9">
	               								   <button id="sa" type="submit" ng-click="salvarAlteracoes()" class="btn btn-oval btn-success pull-left">         	
				         								<em class="fa fa-pencil fa-fw mr-sm"></em>Salvar as alterações
				         					  	   </button>
			         					  	   </div>
               								</form>
               							</div>
		                              
		                           </div>		                           
		                           <div ng-show="edit" id="avatar" class="tab-pane fade">
		                              
		                              <div class="col-sm-13">
		                              	  <h4>Messages Tab</h4>
			                              <input ng-click="escolherArquivo = true" id="fileInput" type="file" data-classbutton="btn btn-default" 
			                                     data-buttonText="Escolher arquivo" data-classinput="form-control inline" class="filestyle form-control">
			                              
			                              <button ng-show="myImage != ''" type="button" ng-click="cortar();" class="btn btn-labeled btn-green">
				                           		<span class="btn-label"><i class="fa fa-scissors"></i>
				                          		</span>Cortar
				                          </button>
				                          
			                              </br>       
			                              <div ng-show="escolherArquivo" class="cropArea">
										    <img-crop image="myImage" result-image="myCroppedImage"></img-crop>
										  </div>
										  										  
										  <button id="sa" ng-show="myImage != ''" type="submit" ng-click="salvarAlteracoes()" class="btn btn-oval btn-success pull-left">         	
			         								<em class="fa fa-pencil fa-fw mr-sm"></em>Salvar as alterações
			         					  </button>
			                          </div> 
		                              
		                           </div>
		                           
		                           	  <button ng-click="edit = true" ng-hide="edit == true" type="button" class="btn btn-oval btn-info pull-right">         	
		         							<em class="fa fa-pencil fa-fw mr-sm"></em>Editar
		         					  </button>
		         					  
		         					  <a ng-click="edit = false" ng-show="edit == true"  href="#dadosCadastrais" data-toggle="tab">
		         					  		<button type="button" class="btn btn-oval btn-danger pull-right">         	
		         								<em class="fa fa-pencil fa-fw mr-sm"></em>Cancelar
		         					  		</button>
		         					  <a/>
		         					  
		         					  
		                           		                           
		                        </div>
		                     </div>
		                  </div>
		                  <!-- END panel-->
		               </div>
					   
					   <!--END Painel -->
				  </div> 
				  </div>              
               
               </section>
               
            </div>
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
   <script src="<c:url value='/resources/assets/jloader/js/jquery.oLoader.min.js' />" ></script>
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
   <!-- App Main-->
   <script src="<c:url value='/resources/assets/js/app.js' />"></script>
   <!-- END Scripts-->  
   
   <script src="<c:url value='/resources/js/elif.js' />"></script>
   
   <script src="<c:url value='/resources/js/util.js' />"></script>
   
   <script src="<c:url value='/resources/js/js-template/jquery.mask.min.js' />"></script>
   <script src="<c:url value='/resources/js/validacaoDeCamposCadastro.js' />"></script>

   <script src="<c:url value='/protected/controller/clienteController.js' />"></script>   