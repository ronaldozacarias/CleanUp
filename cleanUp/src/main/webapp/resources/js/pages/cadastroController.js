function cadastroController($scope, $http) {

	$scope.url = "/";

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

	// Essa função cria um contato
	$scope.salvarPessoa = function(newCadastro) {

//		if (!newContactForm.$valid) {
//			$scope.displayValidationError = true;
//			return;
//		}

		var url = $scope.url;

		var config = {
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'
			}
		};

		$http.post(url, $.param($scope.pessoa, $scope.usuario, $scope.endereco), config).success(function() {
			console.log("ok");
        });
	};
	
	
	
	//Essa Funçãoremove um contato contato
//	$scope.createContact = function(newContactForm) {
//
//		if (!newContactForm.$valid) {
//			$scope.displayValidationError = true;
//			return;
//		}
//
//		var url = $scope.url;
//
//		var config = {
//			headers : {
//				'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'
//			}
//		};
//
//		$http.post(url, $.param($scope.contact), config).success(function() {
//			$scope.getContactList();
//        });
//	};
//	
//	$scope.getContactList();
}