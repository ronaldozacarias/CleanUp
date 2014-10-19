function diaristaController($scope, $filter, $http) {
	
	/*---------  LIST NOTIFICATIONS DIARISTAS FROM DATABASE  ------------------------------*/  
	listarNotificacoes();
	
	
	
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
	    	console.log($scope.notificacoes);
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
	$scope.selectedCliente = function (cliente) {
        var selectedCliente = angular.copy(cliente);
        
        $(function () {
            $("#myModal").on('shown.bs.modal', function () {
                google.maps.event.trigger(map, 'resize');
            });
        });       
        
    };
    
    
    /*---------  GOOGLE MAPS ---------------------------------------*/
    
    
    
    var map;

    function initialize() {
    	  var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
    	  var mapOptions = {
    	    zoom: 4,
    	    center: myLatlng
    	  };

    	  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    	  var contentString = 'Endereço';

    	  var infowindow = new google.maps.InfoWindow({
    	      content: contentString
    	  });

    	  var marker = new google.maps.Marker({
    	      position: myLatlng,
    	      map: map,
    	      title: 'Uluru (Ayers Rock)'
    	  });
    	  google.maps.event.addListener(marker, 'click', function() {
    	    infowindow.open(map,marker);
    	  });
    	}

    google.maps.event.addDomListener(window, 'load', initialize);
	
}