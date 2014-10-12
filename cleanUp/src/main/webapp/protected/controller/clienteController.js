function clienteController($scope, $filter, $http) {
	
	$scope.url = "/cleanUp/protected/servico/add";
	$scope.enderecos = [];
	var count = 0;
	
	/*---------  SENDING SERVICO  -----------------------------------------*/
	$scope.enviarServico = function(servicoForm) {
		
		var url = $scope.url;
		
		$scope.servicoVO = {
				descricao: $scope.descricao,
				data: $scope.data,
				enderecos: $scope.enderecos,
				diarista:$scope.diarista
		};
		
		if($scope.descricao != '' &&
		   $scope.data != ''){			
			
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
            console.log($scope.enderecos);
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
    	count++;
    	console.log("Rodou pela " + count + "ª vez");
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
        var selectedDiarista = angular.copy(diarista);
        $scope.diarista = selectedDiarista;
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
    		
    					$('.txtEndereco').val(results[0].formatted_address);
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
    			carregarNoMapa($(".txtEndereco").val());
    	})
    	
    	$(".txtEndereco").blur(function() {
    		if($(this).val() != "")
    			carregarNoMapa($(this).val());
    	})
    	
    	google.maps.event.addListener(marker, 'drag', function () {
    		geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
    			if (status == google.maps.GeocoderStatus.OK) {
    				if (results[0]) {  
    					$('.txtEndereco').val(results[0].formatted_address);
    					$('#txtLatitude').val(marker.getPosition().lat());
    					$('#txtLongitude').val(marker.getPosition().lng());
    				}
    			}
    		});
    	});
    	
    	$(".txtEndereco").autocomplete({
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