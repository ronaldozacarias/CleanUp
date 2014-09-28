function clienteController($scope, $http) {

	/*############ LISTAS DIARISTAS ##############*/
	//Trazer especialidades do banco
	$http({
        url: '/cleanUp/protected/cliente/diaristas/listDiaristas',
        method: "POST",
        headers: {'Content-Type': 'application/json'}
    })
    .success(function (data, status, headers, config) {
    	$scope.diaristas = data;
    	console.log($scope.diaristas);
    })
    .error(function (data, status, headers, config) {
    	bootbox.dialog({
    		title:"Erro inesperado!",
            message: data
        });
    });
	
}