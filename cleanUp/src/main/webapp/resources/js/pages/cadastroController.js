function cadastroController($scope, $http) {

	$scope.url = "/cleanUp/public/cadastro/";
	
	$scope.values = {};
	
	$scope.termos = false;
		
	$scope.especialidades = [
	            {
	            	'id':1,
	            	'especialidade':'Passar'
	            },
	            {
	            	'id':2,
	            	'especialidade':'Limpar'
	            },
	            {
	            	'id':3,
	            	'especialidade':'Arrumar'
	            },
	            {
	            	'id':4,
	            	'especialidade':'Fachinar'
	            },
	            {
	            	'id':5,
	            	'especialidade':'Cozinhar'
	            }
	];
	

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
	$scope.pessoa = {};
	
	$scope.message = "Cadastro realizado com sucesso!";

	// Essa função cria um contato
	$scope.createPeople = function(newPeopleForm) {
		
		var cpf = $scope.pessoa.cpf;
		cpf = cpf.replace('.','').replace('.','').replace('-','');
		$scope.pessoa.cpf = cpf;
		
		var tel = $scope.pessoa.telefone;
		tel = tel.replace('(','').replace(')','').replace(' ','').replace('-','');
		$scope.pessoa.telefone = tel;

		if ($scope.termos == true &&
		    $scope.pessoa.nome != null &&
		    $scope.pessoa.cpf != null &&
		    $scope.pessoa.endereco != null &&
		    $scope.pessoa.cidade != null &&
		    $scope.pessoa.email != null &&
		    $scope.pessoa.senha != null &&
		    $scope.pessoa.telefone != null) {
			
//			$scope.returnMessageSuccess = true;
			
			if($scope.mostrar){
				$scope.pessoa.tipo = 0;
			}else{
				$scope.pessoa.tipo = 1;
			}			
			
		var url = $scope.url;

		var config = {
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'
			}
		};

		$http.post(url + "add", $.param($scope.pessoa), config).success(function(data) {
			$scope.message = "Cadastro realizado com sucesso!";
			$scope.$scope.returnMessageSuccess = true;
			alert("que beleza")
			
        }).error(function(data) {
        	$scope.message = "Erro!";
			$scope.$scope.returnMessageError = true;
       });
		
		}
	};
	
	
	
//	$scope.getContactList();
}