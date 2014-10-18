function diaristaController($scope, $filter, $http) {
	
	/*---------  LIST NOTIFICATIONS DIARISTAS FROM DATABASE  ------------------------------*/  
	listarNotificacoes();
	
	function listarNotificacoes(){
		$http({
	        url: '/cleanUp/protected/notificacoes/getNotificacoes',
	        method: "GET",
	        headers: {'Content-Type': 'application/json'}
	    })
	    .success(function (data, status, headers, config) {    	
	    	$scope.notificacoes = data;
	    	console.log($scope.notificacoes.length);
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
	
}