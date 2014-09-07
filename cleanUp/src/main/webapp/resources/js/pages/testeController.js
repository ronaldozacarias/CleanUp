function testeController($scope, $http) {

	$scope.url = "/cleanUp/public/cadastro/";

	//Essa função retorna a lista de contatos do backend 
//	$scope.getContactList = function() {
//
//		var url = $scope.url;
//
//		$http.get(url).success(function(data) {
//			$scope.contacts = data;
//			//console.log($scope.contacts);
//		});
//	};
	$scope.cliente = {};

	// Essa função cria um contato
	$scope.createPeople = function(newPeopleForm) {

//		if (!newPeopleForm.$valid) {
//			$scope.displayValidationError = true;
//			return;
//		}

		var url = $scope.url;

		var config = {
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'
			}
		};

		$http.post(url + "add", $.param($scope.cliente), config).success(function() {
			console.log($scope.cliente);
        });
	};
	
//	$scope.getContactList();
}