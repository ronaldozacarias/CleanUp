function cadastroController($scope, $http) {
	
	$scope.especialidades = new Array();
	$scope.especialidadesDiarista = [];
	$scope.cidades = new Array();
	$scope.url = "/cleanUp/public/";	
	$scope.values = false;
	$scope.termos = false;
	$scope.pessoa = {};
	
	//Trazer especialidades do banco
	$http({
        url: '/cleanUp/public/diarista/getEspecialidades',
        method: "POST",
        headers: {'Content-Type': 'application/json'}
    })
    .success(function (data, status, headers, config) {
    	$scope.especialidades = data;
    	console.log($scope.especialidades);
    })
    .error(function (data, status, headers, config) {
    	exibirMensagemErro(data);
    });
	
	//Trazer cidades do banco
	$http({
        url: '/cleanUp/public/cadastro/getCidades',
        method: "POST",
        headers: {'Content-Type': 'application/json'}
    })
    .success(function (data, status, headers, config) {
    	$scope.cidades = data;
    	console.log($scope.cidades);
    })
    .error(function (data, status, headers, config) {
    	exibirMensagemErro(data);
    });	
	
	function checkList(){
		if($scope.values){
			especialidadesDiarista.push();
		}
	}		

	//Esta função retorna a lista de especialidades do backend 
//	$scope.getEspecialidades = function() {
//
//		var url = $scope.url + "diarista/getEspecialidades";
//
//		$http.get(url).success(function(data) {
//			$scope.especialidades = data;
//		}).error(function(data) {
//        	$scope.message = "Erro!";
//			$scope.$scope.returnMessageError = true;
//       });
//	};
	
	
	
	$scope.message = "Cadastro realizado com sucesso!";

	// Essa funÃ§Ã£o cria um contato
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
//				console.log($scope.especialidadesDiarista);
				$scope.pessoa.especialidades = $scope.especialidadesDiarista;				
//				console.log($scope.pessoa.especialidades);
				
				
				
			}else{
				$scope.pessoa.tipo = 1;
				console.log($scope.pessoa);
			}			
			
		var url = $scope.url;

//		var config = {
//				headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
//		};
		

		console.log($scope.pessoa.especialidades);
		$http({
            url: url + "cadastro/add",
            data: $scope.pessoa,
            method: "POST",
            headers: {'Content-Type': 'application/json'}
        }).success(function(data) {
			$scope.message = "Cadastro realizado com sucesso!";
			$scope.returnMessageSuccess = true;
			$scope.pessoa = null;
        }).error(function(data) {
        	$scope.message = "Erro!";
			$scope.returnMessageError = true;
       });
		
//		$http.post(url + "cadastro/add", $.param($scope.pessoa), config).success(function(data) {
//			$scope.message = "Cadastro realizado com sucesso!";
//			$scope.$scope.returnMessageSuccess = true;
//			alert("que beleza");
//			
//        }).error(function(data) {
//        	$scope.message = "Erro!";
//			$scope.$scope.returnMessageError = true;
//       });
		
		}
	};
	
//$scope.getEspecialidades();
}

