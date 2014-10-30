function clienteController($scope, $filter, $http) {
	
	$scope.url = "/cleanUp/protected/servico/add";
	$scope.enderecos = [];
	var count = 0;
	$scope.arrayEnd = false;
	$scope.msg = '';
	listarNotificacoes();
	$scope.data = 0;
	$scope.minDate = '';
	
	var hoje = new Date();

    var d = hoje.getDate();
    var m = hoje.getMonth() +1;
    var y = hoje.getFullYear();
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
	
	
	function listarNotificacoes(){
		$http({
	        url: '/cleanUp/protected/notificacoes/getNotificacoesPorCliente',
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
			
	}, 10000);	
	
	/*---------  SENDING SERVICO  -----------------------------------------*/
	$scope.enviarServico = function(servicoForm) {
		
		var url = $scope.url;
		
		var d =  $scope.data;
		var time = new Date($scope.data);
		var d1 = time.getTime() + 10800000;
 		
		$scope.servicoVO = {
				descricao: $scope.descricao,
				data: d1,
				enderecos: $scope.enderecos,
				diarista:$scope.diarista
		};
		
		console.log($scope.servicoVO.data);
		
		if($scope.enderecos.length <= 0){
			$scope.msg = ' Para adicionar um endereço, clique no botão verde "+"';
			$scope.arrayEnd = true;
			
		}
		
		if($scope.descricao != '' &&
		   $scope.data != '' && $scope.enderecos.length > 0){			
			
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
	        		message: "<div class='loginbootbox'><a href='/cleanUp/login'>Clique aqui e realize o login</a></div>"
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
	$http({
        url: '/cleanUp/protected/cliente/diaristas/listDiaristas',
        method: "GET",
        headers: {'Content-Type': 'application/json'}
    })
    .success(function (data, status, headers, config) {    	
    	$scope.diaristas = data;    	
    })
    .error(function (data, status, headers, config) {
    	bootbox.dialog({
    		title:"Erro inesperado!",
            message: data
        });
    });
	
/*---------  END LIST DIARISTAS FROM DATABASE  ------------------------------*/
	
 /*---------  SET DIARISTA IN MODAL  ------------------------------*/
	$scope.selectedDiarista = function (diarista) {
		$scope.minDate = datamin;
        var selectedDiarista = angular.copy(diarista);
        $scope.diarista = selectedDiarista;
        $('#myModal').modal({
            show: 'true'
        });
    };
 /*---------  END SET DIARISTA IN MODAL  ------------------------------*/
        
    
 /*---------  RESET MODAL BOOTSTRAP  ------------------------------*/
    $('.modal').on('hidden.bs.modal', function(){
        $(this).find('form')[0].reset();
        $scope.reset();
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
    	
//    	$("form").submit(function(event) {
//    		$scope.enviarServico(servicoForm);
//    	});
    });

 /*---------  END GOOGLE MAPS API  ------------------------------*/   
    
    
    
    
    
  /* ----------------  THREAD EM JAVASCRIPT ------------------------ */
  
    /*var intervalo = window.setInterval(function() {
	
	$http({
        url: '/cleanUp/protected/cliente/diaristas/listDiaristas',
        method: "GET",
        headers: {'Content-Type': 'application/json'}
    })
    .success(function (data, status, headers, config) {    	
    	$scope.diaristas = data;
    	count++;
    	console.log("Rodou pela " + count + "ª vez");
    })
    .error(function (data, status, headers, config) {
    	bootbox.dialog({
    		title:"Erro inesperado!",
            message: data
        });
    });
	
	}, 10000);

window.setTimeout(function() {
	clearInterval(intervalo);
}, 30000); */
	
}