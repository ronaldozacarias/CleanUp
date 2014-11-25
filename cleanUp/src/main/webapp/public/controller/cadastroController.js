var app = angular.module("app", ['checklist-model','ui.bootstrap']);

function cadastroController($scope, $http, $filter, $timeout) {
	
	$scope.especialidades = new Array();
	$scope.especialidadesDiarista = [];
	$scope.cidades = new Array();
	$scope.url = "/cleanUp/public/";	
	$scope.values = false;
	$scope.termos = false;
	$scope.pessoa = {};
	$scope.selected = undefined;
	
	
	function checkList(){
		if($scope.values){
			especialidadesDiarista.push();
		}
	}
	
	
	//Trazer especialidades do banco
	$http({
        url: '/cleanUp/public/cadastro/getEspecialidades',
        method: "POST",
        headers: {'Content-Type': 'application/json'}
    })
    .success(function (data, status, headers, config) {
    	$scope.especialidades = data;
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
    })
    .error(function (data, status, headers, config) {
    	exibirMensagemErro(data);
    });	
	
	$scope.message = "Cadastro realizado com sucesso!";

	// Essa função cria um contato
	$scope.createPeople = function(newPeopleForm) {
		
		$scope.pessoa.cidade = $scope.selected.codigoCidade + "";
		
		var cpf = $scope.pessoa.cpf;
		cpf = cpf.replace('.','').replace('.','').replace('-','');
		$scope.pessoa.cpf = cpf;
		
		var tel = $scope.pessoa.telefone;
		tel = tel.replace('(','').replace(')','').replace(' ','').replace('-','');
		$scope.pessoa.telefone = tel;

		if ($scope.termos == true &&
		    $scope.pessoa.nome != null &&
		    $scope.pessoa.cpf != null &&
		    $scope.pessoa.cidade != null &&
		    $scope.pessoa.email != null &&
		    $scope.pessoa.senha != null &&
		    $scope.pessoa.telefone != null) {
			
			if($scope.mostrar){
					$scope.pessoa.tipo = 0;
					$scope.pessoa.especialidades = $scope.especialidadesDiarista;
					
					
					if($scope.pessoa.endereco != null){
						var url = $scope.url;
						
						
						console.log($scope.pessoa.especialidades);
						$http({
				            url: url + "cadastro/add",
				            data: $scope.pessoa,
				            method: "POST",
				            headers: {'Content-Type': 'application/json'}
				        }).success(function(data) {
				        	bootbox.dialog({
				        		title:"Cadastro realizado com sucesso!",
				        		message: "<div class='loginbootbox'><a href='/cleanUp/login'>Clique aqui e realize o login</a></div>"
				            });
							$scope.pessoa = null;
				        }).error(function(data) {
				        	exibirMensagemErro(data);
				       });
					}					
					
					
				}else{
					
					$scope.pessoa.tipo = 1;
					console.log($scope.pessoa);
					
					var url = $scope.url;
					
					
					console.log($scope.pessoa.especialidades);
					$http({
			            url: url + "cadastro/add",
			            data: $scope.pessoa,
			            method: "POST",
			            headers: {'Content-Type': 'application/json'}
			        }).success(function(data) {
			        	bootbox.dialog({
			        		title:"Cadastro realizado com sucesso!",
			        		message: "<div class='loginbootbox'>" +
			        					"<a href='/cleanUp/login'>Clique aqui e realize o login</a>" +
			        				 "</div>"
			            });
						$scope.pessoa = null;
			        }).error(function(data) {
			        	exibirMensagemErro(data);
			       });				
					
			}	
			
	   }
	};

}

