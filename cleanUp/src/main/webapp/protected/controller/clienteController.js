var app = angular.module("app", ['ui.bootstrap']);

	   app.filter('startFrom', function() {
	       return function(input, start) {
	           if(input) {
	               start = +start; //parse to int
	               return input.slice(start);
	           }
	           return [];
	       };
	   });

function clienteController($scope, $filter, $http, $timeout, $location) {
    
	console.log('[ClienteController Iniciado]');
	
    $scope.url = "/cleanUp/protected/servico/add";
    $scope.enderecos = [];
    $scope.arrayEnd = false;
    $scope.msg = '';
    listarNotificacoes();
    listarServicosCli();
    listarDiaristas();
    $scope.data;
    $scope.minDate = '';
    $scope.searchDiarista = '';
    $scope.searchService = ''; 
    $scope.score;
    $scope.showAvaliacao = false;
    $scope.showServicos = true;
    $scope.diaristas = null;
    $scope.servicosList = null;
    
    $scope.countServPendente = 0;
    $scope.countServCancel = 0;

    var hoje = new Date();

    var d = hoje.getDate()+"";
    var m = hoje.getMonth() +1+"";
    var y = hoje.getFullYear()+"";
    
    if(d.length == 1 ){
        d = '0' + d;
    };
    
    if(m.length == 1){
        m = '0' + m;
    };
    
    var datamin = y + '-' + m + '-' + d;
    
    
    // Disable weekend selection
    $scope.disabled = function(date, mode) {
      return ( mode === 'day' && ( date.getDay() === 0 || date.getDay() === 6 ) );
    };
    
    $scope.toggleMin = function() {
        $scope.minDate = $scope.minDate ? null : new Date();
      };
      $scope.toggleMin();

      $scope.open = function($event) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.opened = true;
      };

      $scope.dateOptions = {
        formatYear: 'yy',
        startingDay: 1
      };

      $scope.formats = ['dd/MM/yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
      $scope.format = $scope.formats[0];
      
      
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
        $http({
            url: '/cleanUp/protected/notificacao/getNotificacoesPorCliente',
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
    
    var thread = setInterval(function() {
            
            listarNotificacoes();
            
    }, 30000);  
    
    /*---------  SENDING SERVICO  -----------------------------------------*/
    $scope.enviarServico = function(servicoForm) {        
        
        var url = $scope.url;
        
        var param = $('#dp').val();
        var pattern = /(\d{2})\/(\d{2})\/(\d{4})/;
        var dt = new Date(param.replace(pattern,'$3-$2-$1'));
        var dateVO = dt.getTime() + 10800000; 
        
        $scope.data = dateVO;
        
        $scope.servicoVO = {
                descricao: $scope.descricao,
                data: $scope.data,
                enderecos: $scope.enderecos,
                diarista:$scope.diarista
        };
        
        console.log($scope.servicoVO.data);
        
        if($scope.enderecos.length <= 0){
            $scope.msg = ' Para adicionar um endereço, clique no botão verde "+"';
            $scope.arrayEnd = true;
            
        }
        
        if($scope.descricao != '' &&
           $scope.data != '' && $scope.enderecos.length > ""){           
            
        	hideModal();
        	
            console.log("INTO");
            
            $http({
                url: url,
                data: $scope.servicoVO,
                method: "POST",
                headers: {'Content-Type': 'application/json'}
            }).success(function(data) {
                hideModal();
                bootbox.dialog({
                    title:"Solicitação realizada com sucesso!",
                    message: "<div class='loginbootbox'>Obrigado por sua preferencia</div>"
                });
                $scope.pessoa = null;
            }).error(function(data) {
                exibirMensagemErro(data);
           });          
            
        }   
        
    };
    

    /*---------  ADD ENDERECO IN LIST  -----------------------------------------*/
    $scope.addEndereco = function () {
        if($scope.logradouro){
            $scope.enderecos.push({
                logradouro: $scope.logradouro,
                lat: $scope.lat,
                lng: $scope.lng
            });
            
            if($scope.enderecos.length > 0){
                $scope.arrayEnd = false;
            }            
        }else{
            $scope.msg = ' É necessário que digite um endereço';
            $scope.arrayEnd = true;
        }

        /*---------  CLEAN INPUT AFTER ADD ENDERECO  ------------------------------*/
        $scope.logradouro = "";
        $scope.lat = "";
        $scope.lng = "";

    };
    
    /*---------  REMOVE ENDERECO  ------------------------------*/
    $scope.removeEndereco = function(index) {

        $scope.enderecos.splice(index, 1);
    };
    
    /*---------  RESET MODAL AFTER EXIT, CLOSE OR SENDING ------------------------------*/
    $scope.reset = function() {

        $scope.enderecos.splice(0, $scope.enderecos.length);
    };
         

 /*---------  LIST DIARISTAS FROM DATABASE  ------------------------------*/    
  function listarDiaristas(){
	  
	  	var url = "" + $location.$$absUrl;
  	
  		if(url == "http://localhost:8080/cleanUp/protected/home"){
  	
			$http({
				url : '/cleanUp/protected/diarista/ranqueamentoDiarista',
				method : "GET",
				headers : {
					'Content-Type' : 'application/json'
				}
			}).success(function(data, status, headers, config) {
				$scope.diaristas = data;
				$scope.MasterDiarista = data[0];
				doPaginationDiarist($scope.diaristas);
			}).error(function(data, status, headers, config) {
				bootbox.dialog({
					title : "Erro inesperado!",
					message : data
				});
			});
  		}  
  }
    
    function doPaginationCli(data){
    	$scope.currentPage = 1; //current page
        $scope.entryLimit = 3; //max no of items to display in a page
        $scope.maxSize = 5;
        $scope.filteredItems = data.length; //Initially for no filter  
        $scope.totalItems = data.length;
    };
    
    function doPaginationDiarist(data){
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
    
    
    /*END*/
    
/*---------  END LIST DIARISTAS FROM DATABASE  ------------------------------*/
    
 /*---------  SET DIARISTA IN MODAL  ------------------------------*/
    $scope.selectedDiarista = function (diarista) {
    	initialize();
    	
    	$scope.minDate = datamin;
        
        $('#datePicker').data("DateTimePicker").setMinDate(datamin);
        
        var selectedDiarista = angular.copy(diarista);
        $scope.diarista = selectedDiarista;
        $('#myModal').modal({
            show: 'true'
        });
    };
    
    
    /*---------  SET CLIENT IN MODAL  ------------------------------*/
    $scope.selectedServicoAlaviacao = function (servico) {
        var selectedServicoAlaviacao = angular.copy(servico);
        $scope.servico = selectedServicoAlaviacao; 
        
        $scope.showAvaliacao = true;
        $scope.showServicos = false;
    };
    
    
$scope.salvarClassificacao = function(servico){
        
        if($scope.score != 0){
            
            $scope.classificacaoVO = {
                pontuacao : $scope.score,
                comentario : $scope.comentario,
                servico: servico
            };
            
            $http({
                url: '/cleanUp/protected/cliente/avaliarServico',
                method: "POST",
                data: $scope.classificacaoVO,
                method: "POST",
                headers: {'Content-Type': 'application/json'}
            })
            .success(function (data, status, headers, config) {     
                bootbox.dialog({
                    title:"Solicitaçãoo realizada com sucesso!",
                    message: "<div class='loginbootbox'>Obrigado por nos dar sua opinião!</div>"
                });
                listarServicosCli();
                
                $scope.classificacaoVO = "";
                
                document.getElementById("comentario").value = "";
                
                $scope.showAvaliacao = false;
                $scope.showServicos = true;
            })
            .error(function (data, status, headers, config) {
                bootbox.dialog({
                    title:"Erro inesperado!",
                    message: data
                });
            });         
            
        }
        
                
    };
    
    
    $scope.cancelarClassificacao = function(){
        
        $scope.score;
        
        $scope.classificacaoVO = "";
        
        document.getElementById("comentario").value = "";
        
        $('#starclassification').raty({
              score : 0
        });
        
        $scope.showAvaliacao = false;
        $scope.showServicos = true;
    };
    
 /*---------  END SET DIARISTA IN MODAL  ------------------------------*/
        
    
 /*---------  RESET MODAL BOOTSTRAP  ------------------------------*/
    $('.modal').on('hidden.bs.modal', function(){
        $(this).find('form')[0].reset();
        $scope.reset();
    });
    
    $('.modal').on('hidden.bs.modal', function(){
        $(this).find('form')[0].reset();
        $scope.$digest();
    });
    
    function hideModal(){
        $('#myModal').modal('hide');
    }
 /*---------  END MODAL BOOTSTRAP  ------------------------------*/
   
    
    
    
    
 /*---------  GOOGLE MAPS API  ------------------------------*/  
    
    var geocoder;
    var map;
    var marker;

    function initialize() {
        var latlng = new google.maps.LatLng(-18.8800397, -47.05878999999999);
        var options = {
            zoom: 5,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        
        map = new google.maps.Map(document.getElementById("mapa"), options);
        
        geocoder = new google.maps.Geocoder();
        
        marker = new google.maps.Marker({
            map: map,
            draggable: true,
        });
        
        marker.setPosition(latlng);
    }

    $(document).ready(function () {

        initialize();
        
        function carregarNoMapa(endereco) {
            geocoder.geocode({ 'address': endereco + ', Brasil', 'region': 'BR' }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[0]) {
                        var latitude = results[0].geometry.location.lat();
                        var longitude = results[0].geometry.location.lng();
            
                        $('#txtEndereco').val(results[0].formatted_address);
                        $('#txtLatitude').val(latitude);
                        $('#txtLongitude').val(longitude);
                        
                        $scope.logradouro = results[0].formatted_address;
                        $scope.lat = latitude;
                        $scope.lng = longitude;
            
                        var location = new google.maps.LatLng(latitude, longitude);
                        marker.setPosition(location);
                        map.setCenter(location);
                        map.setZoom(16);
                    }
                }
            })
        }
        
        $("#btnEndereco").click(function() {
            if($(this).val() != "")
                carregarNoMapa($("#txtEndereco").val());
        })
        
        $("#txtEndereco").blur(function() {
            if($(this).val() != "")
                carregarNoMapa($(this).val());
        })
        
        google.maps.event.addListener(marker, 'drag', function () {
            geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[0]) {  
                        $('#txtEndereco').val(results[0].formatted_address);
                        $('#txtLatitude').val(marker.getPosition().lat());
                        $('#txtLongitude').val(marker.getPosition().lng());
                    }
                }
            });
        });
        
        $("#txtEndereco").autocomplete({
            source: function (request, response) {
                geocoder.geocode({ 'address': request.term + ', Brasil', 'region': 'BR' }, function (results, status) {
                    response($.map(results, function (item) {
                        return {
                            label: item.formatted_address,
                            value: item.formatted_address,
                            latitude: item.geometry.location.lat(),
                            longitude: item.geometry.location.lng()                             
                        }
                        $scope.endereco.logradouro = value;
                    }));
                })
            },
            select: function (event, ui) {
                $("#txtLatitude").val(ui.item.latitude);
                $("#txtLongitude").val(ui.item.longitude);
                var location = new google.maps.LatLng(ui.item.latitude, ui.item.longitude);
                marker.setPosition(location);
                map.setCenter(location);
                map.setZoom(16);
            }
        });
        
//      $("form").submit(function(event) {
//          $scope.enviarServico(servicoForm);
//      });
    });

 /*---------  END GOOGLE MAPS API  ------------------------------*/   
    
    
    function listarServicosCli(){
    	
    	var url = "" + $location.$$absUrl;
    	
    	if(url == "http://localhost:8080/cleanUp/protected/cliente/servicosCliente"){
    		
    		$scope.currentPage = null;
    	    $scope.entryLimit = null;
    	    $scope.maxSize = null;
    	    $scope.filteredItems = null;  
    	    $scope.totalItems = null;
    		
    		$http({         
                url: '/cleanUp/protected/servico/listarServicosPorClienteCli',
                method: "POST",
                headers: {'Content-Type': 'application/json'}
            })
            .success(function (data, status, headers, config) {                 
                $scope.servicosList = data;
                
                for(var i = 0 ; i < $scope.servicosList.length ; i++){
                	if($scope.servicosList[i].status == 'PENDENTE'){
                		$scope.countServPendente++;
                	}
                	if($scope.servicosList[i].status == 'INATIVO'){
                		$scope.countServCancel++;
                	}
                	
                }
                
                doPaginationCli($scope.servicosList);
                
                
                
                $('#starclassification').raty({
                      click: function(score, evt) {
                        $scope.score = score;
                        console.log( $scope.score);
                      }
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
        
}