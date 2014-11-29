var app = angular.module("app", ['ui.bootstrap', 'ngImgCrop', 'checklist-model']);

	   app.filter('startFrom', function() {
	       return function(input, start) {
	           if(input) {
	               start = +start; //parse to int
	               return input.slice(start);
	           }
	           return [];
	       };
	   });

function diaristaController($scope, $filter, $http, $timeout, $location) {
	
	/*---------  LIST NOTIFICATIONS DIARISTAS FROM DATABASE  ------------------------------*/ 
	$scope.edit = false;
	listarNotificacoes();
	listarServicos();
	gerarResumoDiarista();
	listarHistoricoServicos();
	var myLatlng;
	$scope.servicos = [];
	$scope.servicosVO = [];
	var markerLatLngs = [];
	$scope.especialidadesDiarista = [];
	$scope.indexNumber = -1;
	$scope.see = true;
	$scope.feedback = true;
	var infowindow;
	$scope.servicosList = new Array();
    $scope.filtered = null;
    $scope.resumo = new Object();
    $scope.totalAval = 0;
    $scope.avalBom = 0;
    $scope.avalRegu = 0;
    $scope.avalRuim = 0;
    $scope.linkNotificacoes = '/cleanUp/protected/diarista/notificacoes';
    $scope.linkPerfil = '/cleanUp/protected/diarista/perfilDiarista';
    $scope.profile = 'ROLE_DIARIST';
    $scope.historico = new Array();
    $scope.diaristaVO = new Object();
    $scope.cidades = new Array();
    $scope.selected = undefined;
	$scope.asyncSelected = null;
	
	$scope.countServPendente = 0;
    $scope.countServCancel = 0;
    $scope.countServConcluido = 0;
    $scope.countSolicitacoes = 0;
	
	function hideModal(){
    	$('#myModal').modal('hide');
    }
	
	function checkList(){
		if($scope.values){
			$scope.especialidadesDiarista.push();
		}
	}
	
	$scope.getLocation = function(val) {
	    return $http.get('http://maps.googleapis.com/maps/api/geocode/json', {
	      params: {
	        address: val,
	        sensor: false
	      }
	    }).then(function(response){
	      return response.data.results.map(function(item){
	        return {
	          location: item.geometry.location,
	          formatted_address: item.formatted_address
	        }
	      });
	    });
	 };
	 
	
	function gerarResumoDiarista(){
		
		var url = "" + $location.$$absUrl;
		
		if(url == "http://localhost:8080/cleanUp/protected/diarista/resumoDiarista" || 
		   url == "http://10.1.2.16:8080/cleanUp/protected/diarista/resumoDiarista"){
			
			 $http({         
		          url: '/cleanUp/protected/relatorios/gerarRelatorioDiarista',
		          method: "GET",
		          headers: {'Content-Type': 'application/json'}
		      })
		      .success(function (data, status, headers, config) {                 
		          $scope.resumo = data;
		          
		          $scope.totalAval = $scope.resumo.numeroBons + $scope.resumo.numeroRuins + $scope.resumo.numeroRegulares;
		          
		          var bom = ( $scope.resumo.numeroBons * 100 ) / $scope.totalAval;
		          $scope.avalBom = Math.round( bom );
		          
		          var regular = ( $scope.resumo.numeroRegulares * 100 ) / $scope.totalAval;
		          $scope.avalRegu = Math.round( regular );
		          
		          var ruim = ( $scope.resumo.numeroRuins * 100 ) / $scope.totalAval;
		          $scope.avalRuim = Math.round( ruim );
		          
		          
		          var doughnutData = [
		      	    				
		                            {
										value: $scope.avalRegu,
										color: "#ff902b",
										highlight: "#FF732B",
										label: "Avaliações regulares"
									},
		      	    				{
		      	    					value: $scope.avalRuim,
		      	    					color: "#f35839",
		      	    					highlight: "#A50505",
		      	    					label: "Avaliações Ruíns"
		      	    				},
		      	    				{
		      	    					value: $scope.avalBom,
		      	    					color:"#7bbf62",
		      	    					highlight: "#006400",
		      	    					label: "Avaliações positivas"
		      	    				}
		      	    			];

		      	var ctx = document.getElementById("chart-area").getContext("2d");
		      	window.myDoughnut = new Chart(ctx).Doughnut(doughnutData, {responsive : true});
		          
		          
		          
		          var loader1 = $('.aBo').ClassyLoader({
		        	    animate: true,
		        	    percentage: $scope.avalBom
		          });
		          
		          var loader2 = $('.aRe').ClassyLoader({
		        	    animate: true,
		        	    percentage: $scope.avalRegu
		          });
		          
		          var loader3 = $('.aRu').ClassyLoader({
		        	    animate: true,
		        	    percentage: $scope.avalRuim
		          });
		          
		          
		      })
		      .error(function (data, status, headers, config) {
		          bootbox.dialog({
		              title:"Erro inesperado!",
		              message: data
		          });
		      });
			
		}
		
	};
	
	$scope.salvarAlteracoes = function(editPerfil){
  	  
  	  if($scope.diaristaVO.nome != undefined &&
  	     $scope.diaristaVO.cpf != undefined &&
  	     $scope.diaristaVO.telefone != undefined &&
  	     $scope.diaristaVO.usuario.email != undefined &&
  	     $scope.diaristaVO.endereco.logradouro != undefined &&
  	     $scope.diaristaVO.usuario.senha != undefined &&
		 $scope.especialidadesDiarista.length != 0 && 
		 $scope.selected != ""){
  		  
  		 $('body').oLoader({
		      backgroundColor:'#fff',
		      fadeInTime: 500,
		      fadeOutTime: 1000,
		      image: '/cleanUp/resources/assets/jloader/spinner.gif',
		      style: 0,
		      imageBgColor: 'none',
		      fadeLevel: 1
		 }); 
  		  
   	     $scope.diaristaVO.fotoUsuario = $scope.diaristaVO.fotoUsuario;
  		  
  		 if($scope.selected != undefined){
  			 $scope.diaristaVO.cidade = $scope.selected;
  		 }
  		 
  		 $scope.diaristaVO.newEspecialidade = $scope.especialidadesDiarista;
  		 
  		 if($scope.asyncSelected != null){
  			$scope.diaristaVO.endereco.lat = $scope.asyncSelected.location.lat;
			$scope.diaristaVO.endereco.lng = $scope.asyncSelected.location.lng;
			$scope.diaristaVO.endereco.logradouro = $scope.asyncSelected.formatted_address;
  		 }
  		 
  		 $http({
  	          url: '/cleanUp/protected/diarista/atualizarPerfil',
  	          data: $scope.diaristaVO,
  	          method: "PUT",
  	          headers: {'Content-Type': 'application/json'}
  	      }).success(function(data) {
  	    	    	    	  
  	    	  $( document ).ready(function() {
  	    		   $('body').oLoader('hide');
  	    	  });
  	    	  
  	          bootbox.alert("Perfil atualizado com sucesso!", function() {
		        		location.reload();
		          });   	          
  	          
  	      }).error(function(data) {
  	          exibirMensagemErro(data);
  	     });
  		 
  	  }    	  
  	  
    };
	
	$http({
        url: '/cleanUp/protected/diarista/diaristaLogada',
        method: "GET",
        headers: {'Content-Type': 'application/json'}
    }).success(function(data) {
        $scope.diaristaVO = data;
        
        $scope.fotoUsuario = $scope.diaristaVO.fotoUsuario;
        
        for(var i = 0 ; i < $scope.diaristaVO.especialidades.length ; i++ ){
        	
        	$scope.especialidadesDiarista.push($scope.diaristaVO.especialidades[i].codigoEspecialidade);
        	
        }
        
    }).error(function(data) {
        exibirMensagemErro(data);
    });
	
	//Trazer especialidades do banco
	$http({
        url: '/cleanUp/public/cadastro/getEspecialidades',
        method: "POST",
        headers: {'Content-Type': 'application/json'}
    })
    .success(function (data, status, headers, config) {
    	$scope.especialidadesBanco = data;
    	
    })
    .error(function (data, status, headers, config) {
    	exibirMensagemErro(data);
    });
	
	
	 //Trazer cidades do banco
	$http({
        url: '/cleanUp/public/cadastro/getCidades',
        method: "POST",
        headers: {'Content-Type': 'application/json'}
    })
    .success(function (data, status, headers, config) {
    	$scope.cidades = data;    	
    })
    .error(function (data, status, headers, config) {
    	exibirMensagemErro(data);
    });
	
	
	/*CROP IMG*/
    
    $scope.myImage='';
    $scope.imgTom = $scope.diaristaVO.fotoUsuario;
    $scope.myCroppedImage='';
    
    $scope.cortar = function(){
       if($scope.myImage != ''){
       	  $scope.diaristaVO.fotoUsuario = $scope.myCroppedImage;
       	  $scope.fotoUsuario = $scope.myCroppedImage;
       }
    };
    
    var handleFileSelect=function(evt) {
        var file=evt.currentTarget.files[0];
        var reader = new FileReader();
        reader.onload = function (evt) {
          $scope.$apply(function($scope){
            $scope.myImage=evt.target.result;
          });
        };
        reader.readAsDataURL(file);
      };
    angular.element(document.querySelector('#fileInput')).on('change',handleFileSelect);
    
    /*END CROP*/
	
	function listarHistoricoServicos(){
    	
    	var url = "" + $location.$$absUrl;
    	    	
    	if(url == "http://localhost:8080/cleanUp/protected/diarista/historicoServicosDir" ||
    	   url == "http://10.1.2.16:8080/cleanUp/protected/diarista/historicoServicosDir"){
    		
    		$scope.currentPage = null;
    	    $scope.entryLimit = null;
    	    $scope.maxSize = null;
    	    $scope.filteredItems = null;  
    	    $scope.totalItems = null;
    	    
    	    $http({         
                url: '/cleanUp/protected/diarista/listaAllHistoricoDiarista',
                method: "GET",
                headers: {'Content-Type': 'application/json'}
            })
            .success(function (data, status, headers, config) {
            	
            	for(var i = 0 ; i < data.length; i++){
            		$scope.historico.unshift(data[i]);
            	}
                //doPagination($scope.favoritos);                 
            })
            .error(function (data, status, headers, config) {
                bootbox.dialog({
                    title:"Erro inesperado!",
                    message: data
                });
            });
    		
    	};
    	
    }
	
	function listarServicos(){
		
		var url = "" + $location.$$absUrl;
    	
		if(url == "http://localhost:8080/cleanUp/protected/home" || 
		   url == "http://localhost:8080/cleanUp/protected/diarista/servicos" ||
		   url == "http://localhost:8080/cleanUp/protected/diarista/resumoDiarista" ||
		   url == "http://localhost:8080/cleanUp/protected/diarista/perfilDiarista" ||
		   url == "http://10.1.2.16:8080/cleanUp/protected/home" || 
		   url == "http://10.1.2.16:8080/cleanUp/protected/diarista/servicos" ||
		   url == "http://10.1.2.16:8080/cleanUp/protected/diarista/resumoDiarista"){
    		
    		$scope.currentPage = null;
        	$scope.entryLimit = null;
        	$scope.maxSize = null;
        	$scope.filteredItems = null;  
        	$scope.totalItems = null;
    		
    		$http({
    	        url: '/cleanUp/protected/servico/listarServicosPorDiarista',
    	        method: "POST",
    	        headers: {'Content-Type': 'application/json'}
    	    })
    	    .success(function (data, status, headers, config) { 
    	    	
    	    	for(var i = 0 ; i < data.length; i++){
    	    		if(data[i].status != 'CANCELAR'){
    	    			$scope.servicosList.unshift(data[i]);
    	    		}
    	    	}
    	    	
    	    	$scope.countSolicitacoes = data.length;
    		    
    		    for(var i = 0 ; i < data.length ; i++){
                	if(data[i].status == 'PENDENTE'){
                		$scope.countServPendente++;
                	} 
                	if(data[i].status == 'CONCLUIDO'){
                		$scope.countServConcluido++;
                	}
                	if(data[i].status == 'CANCELAR'){
                		$scope.countServCancel++;
                	}
                }
    		    
    		    doPagination($scope.servicosList);
    	
    	    })
    	    .error(function (data, status, headers, config) {
    	    	bootbox.dialog({
    	    		title:"Erro inesperado!",
    	            message: data
    	        });
    	    });
    		
    	}  		
    	
	};
	
	function doPagination(data){
    	$scope.currentPage = 1; //current page
        $scope.entryLimit = 3; //max no of items to display in a page
        $scope.maxSize = 5;
        $scope.filteredItems = data.length; //Initially for no filter  
        $scope.totalItems = data.length;
    };
    
    $scope.setPage = function(pageNo) {
        $scope.currentPage = pageNo;
    };
    $scope.filter = function() {
    	$scope.filteredItems = $scope.filtered.length;
    };
	
	$http({
        url: '/cleanUp/protected/menu/getMenu',
        method: "POST",
        headers: {'Content-Type': 'application/json'}
    }).success(function(data) {
        $scope.menus = data;
    }).error(function(data) {
        exibirMensagemErro(data);
    }); 

	function listarNotificacoes(){
		
		var url = "" + $location.$$absUrl;
    	
		if(url == "http://localhost:8080/cleanUp/protected/home" || 
		   url == "http://localhost:8080/cleanUp/protected/diarista/servicos" ||
		   url == "http://localhost:8080/cleanUp/protected/diarista/resumoDiarista" ||
		   url == "http://localhost:8080/cleanUp/protected/diarista/notificacoes" ||
		   url == "http://localhost:8080/cleanUp/protected/diarista/perfilDiarista" ||
		   url == "http://10.1.2.16:8080/cleanUp/protected/home" || 
		   url == "http://10.1.2.16:8080/cleanUp/protected/diarista/servicos" ||
		   url == "http://10.1.2.16:8080/cleanUp/protected/diarista/notificacoes" ||
		   url == "http://10.1.2.16:8080/cleanUp/protected/diarista/resumoDiarista"){
			
			$http({
		        url: '/cleanUp/protected/notificacao/getNotificacoes',
		        method: "GET",
		        headers: {'Content-Type': 'application/json'}
		    })
		    .success(function (data, status, headers, config) {
		    	$scope.notificacoes = [];
		    	$scope.note = data;
		    	$scope.count = data.length;
		    	
		    	if(data.length > 0){
			    	for(var i = 0; i < 10 ; i++){
			    		if($scope.note[i]){
			    			$scope.notificacoes.push($scope.note[i]);
			    		};		    		
			    	};
		    	};
		    })
		    .error(function (data, status, headers, config) {
		    	bootbox.dialog({
		    		title:"Erro inesperado!",
		            message: data
		        });
		    });			
		}	
				
	}
	
	var thread = setInterval(function() {
			
			listarNotificacoes();
			
	}, 30000);
	
	$scope.enviarServicos = function(servicoForm){
		
		$scope.aceitarServicoVO = {
			servicosVO: $scope.servicosVO	
		};
		
        $http({
	        url: '/cleanUp/protected/diarista/confirmacao',
	        data: $scope.aceitarServicoVO,
	        method: "POST",
            headers: {'Content-Type': 'application/json'}
	    })
	    .success(function (data, status, headers, config) {   	    	
	    	hideModal();
	    	bootbox.dialog({
        		title:"Serviço enviado com sucesso!",
        		message: "Para cancelar o serviço clique neste <a href='/cleanUp/protected/diarista/servicos'>link</a>"
            });
	    	listarNotificacoes();
	    	listarServicos();
			$scope.aceitarServicoVO = null;
	    })
	    .error(function (data, status, headers, config) {
	    	bootbox.dialog({
	    		title:"Erro inesperado!",
	            message: data
	        });
	    });
		
	};
	
	$scope.cancelarServico = function(servico){
		
		bootbox.confirm("Você deseja realmente cancelar este serviço?" , function(result) {
	  		  if(result == true){
	  			  $scope.cancelarServicoDiarista(servico);
	  		  }
		}); 
		
	};
	
	$scope.cancelarServicoDiarista = function(servico){
		
		$scope.servicoVO = {
			codigo:servico.codServico
		};
		
        $http({
	        url: '/cleanUp/protected/servico/cancelar',
	        data: $scope.servicoVO,
	        method: "POST",
            headers: {'Content-Type': 'application/json; charset=utf-8'}
	    })
	    .success(function (data, status, headers, config) {   	    	
	    	bootbox.dialog({
        		title:"Serviço cancelado com sucesso!",
        		message: "Obrigado por sua preferência"
            });
	    	listarServicos();
	    	listarNotificacoes();
			$scope.aceitarServicoVO = null;
	    })
	    .error(function (data, status, headers, config) {
	    	bootbox.dialog({
	    		title:"Erro inesperado!",
	            message: data
	        });
	    });
		
	};
	
	/*---------  ADD SERVICE IN LIST  -----------------------------------------*/
    $scope.addService = function (servico, index) {
    	
        if(servico){
        	
        	$scope.servicoVO = servico;
        	
            $scope.servicosVO.push($scope.servicoVO);
            
            $scope.servicos.splice(index, 1);
        }
        
    };
    
    /*---------  REMOVE SERVICE OF LIST  ------------------------------*/
    $scope.removeService = function(index) {

    	$scope.servicos.splice(index, 1);
    };
    
	/*---------  SET CLIENTE IN MODAL  ------------------------------*/
	$scope.selectedCliente = function(cliente) {
        
//		$('#myModal2').modal('show');
		//SETANDO CLIENTE SELECIONADO NO SCOPO
		var selectedCliente = angular.copy(cliente);
        $scope.cliente = selectedCliente;
        $scope.pessoa = $scope.cliente;
        
        var codigoCliente = $scope.cliente.codigo;
                
        //BUSCANDO SERVIÇOS SOLICITADOS POR ESSE CLIENTE
        $http({
	        url: '/cleanUp/protected/servico/listarServicosPorCliente',
	        method: "POST",
	        data: 'codigoCliente='+$scope.cliente.codigo,
	        headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
	    })
	    .success(function (data, status, headers, config) {    	
	    	$scope.servicos = data;	    	
	    	
	    	initialize();
	    	
	    	$('#myModal').modal({
	            show: 'true'
	        });
	    	
	    	//RESIZE EM MAPA (CORRIGUE MAPA DO GOOGLE NO MODAL DO BOOTSTRAP)
	        $(function () {
	            $("#myModal").on('shown.bs.modal', function () {
	                google.maps.event.trigger(map, 'resize');
//	                map.setCenter(myLatlng);
	                var bounds = new google.maps.LatLngBounds();
	                for (var i = 0; i < markerLatLngs.length; i++) {
	                	bounds.extend(markerLatLngs[i]);
		            }
	                map.fitBounds(bounds);
	            });
	        }); 
	    	
	    })
	    .error(function (data, status, headers, config) {
	    	bootbox.dialog({
	    		title:"Erro inesperado!",
	            message: data
	        });
	    });           
              
        
    };
    
    
    /*---------  GOOGLE MAPS ---------------------------------------*/
        
    var map;
    var marker;
    
    function initialize() {
    	  myLatlng = new google.maps.LatLng(-25.363882,131.044922);
    	  var mapOptions = {
    	    zoom: 4,
//    	    disableDefaultUI: true,
    	    panControl:false,
    	    zoomControl:true,
    	    mapTypeControl:false,
    	    scaleControl:false,
    	    streetViewControl:true,
    	    overviewMapControl:false,
    	    rotateControl:false,
    	    center: myLatlng
    	  };

    	  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);    	 

    	  setMarkers(map, $scope.servicos);
    	  
    	  infowindow = new google.maps.InfoWindow({
    	      content: '',
    	      maxWidth: 200
    	  });     	  
    	  
    	  
    	  /*
    	  for(var i = 0 ; i < $scope.servicos.length; i++){
    		  
    		  var lat = $scope.servicos[i].endereco.lat;
    		  var lng = $scope.servicos[i].endereco.lng;
    		  
    		  var contentString = $scope.servicos[i].endereco.logradouro;

	    	  
    		  
    		  var markerLatLng = new google.maps.LatLng(lat,lng);
    		  markerLatLngs.push(markerLatLng);
    		  
    		  marker = new google.maps.Marker({
        	      position: markerLatLng,
        	      map: map,
        	      title: $scope.servicos[i].cliente.nome
        	  }); 
    		  
    		  
    		  
    	  }*/
    	  
//    	  google.maps.event.addListener(marker, 'click', function() {
//			    infowindow.open(map,marker);
//		  });

    	}
    
    	function setMarkers(map, servicos) {
    	   markerLatLngs = [];
    	   for (var i = 0; i < servicos.length; i++) {
    	      setMarker(map, servicos[i]);
    	   }
    	}
    	
    	function setMarker(map, servicos) {
    		
    		  var lat = servicos.endereco.lat;
	  		  var lng = servicos.endereco.lng;	    	  
	  		  
	  		  var markerLatLng = new google.maps.LatLng(lat,lng);
	  		  markerLatLngs.push(markerLatLng);
	  		  
	  		  marker = new google.maps.Marker({
	      	      position: markerLatLng,
	      	      map: map,
	      	      title: servicos.cliente.nome
	      	  }); 
    	      
	  		  google.maps.event.addListener(marker, "click", function () {
	  			infowindow.setContent(servicos.endereco.logradouro);
	  			infowindow.open(map, this);
    	      });
    	}

//    google.maps.event.addDomListener(window, 'load', initialize);
	
}
