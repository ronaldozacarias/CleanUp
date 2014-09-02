function cadastroController($scope, $http) {
	
	$scope.url = "cleanUp/public/registrar/";
	
	$scope.perfils = [
	     'ROLE_ADMIN', 
	     'ROLE_USER'
	];
	
	$scope.usuario;
	$scope.pessoa;
	$scope.endereco;
	
	
	$scope.save = function (newPeople) {

        var url = $scope.url;

        var config = {headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};

        $http.post(url, $.param($scope.pessoa, $scope.usuario, $scope.endereco), config)
            .success(function (data) {
                console.log("OK");
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };
	
	
}