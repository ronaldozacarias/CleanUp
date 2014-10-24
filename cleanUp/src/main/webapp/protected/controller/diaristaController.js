function diaristaController($scope, $filter, $http) {
	
	/*---------  LIST NOTIFICATIONS DIARISTAS FROM DATABASE  ------------------------------*/  
	listarNotificacoes();
	var myLatlng;
	$scope.servicos = [];
	var markerLatLngs = [];
	var infowindow;
	
	
	
	$scope.issoaqui = function(){
		alert("Midiã, Neidinha, Mariana Teste de clique");
	};
	
	function listarNotificacoes(){
		$http({
	        url: '/cleanUp/protected/notificacoes/getNotificacoes',
	        method: "GET",
	        headers: {'Content-Type': 'application/json'}
	    })
	    .success(function (data, status, headers, config) {    	
	    	$scope.notificacoes = data;
	    })
	    .error(function (data, status, headers, config) {
	    	bootbox.dialog({
	    		title:"Erro inesperado!",
	            message: data
	        });
	    });		
	}
	
	thread();
	
	function thread(){
		setInterval(function() {
			
			listarNotificacoes();
			
		}, 100000);
	}
	
	/*---------  SET CLIENTE IN MODAL  ------------------------------*/
	$scope.selectedCliente = function(cliente) {
        
		//SETANDO CLIENTE SELECIONADO NO SCOPO
		var selectedCliente = angular.copy(cliente);
        $scope.cliente = selectedCliente;
        $scope.pessoa = $scope.cliente;
        
        var codigoCliente = $scope.cliente.codigo;
        
        
        //BUSCANDO SERVIÇOS SOLICITADOS PO ESSE CLIENTE
        $http({
	        url: '/cleanUp/protected/servico/listarServicosPorCliente',
	        method: "POST",
	        data: 'codigoCliente='+$scope.cliente.codigo,
	        headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
	    })
	    .success(function (data, status, headers, config) {    	
	    	$scope.servicos = data;
	    	
	    	initialize();
	    	
	    	//RESIZE EM MAPA (CORRIGUE MAPA DO GOOGLE NO MODAL DO BOOTSTRAP)
	        $(function () {
	            $("#myModal2").on('shown.bs.modal', function () {
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