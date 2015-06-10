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
	$scope.asyncSelected = null;
	$scope.pessoa.cidade = null;
	
	
	function checkList(){
		if($scope.values){
			especialidadesDiarista.push();
		}
	}
	
	$scope.getLocation = function(val) {
	    return $http.get('http://maps.googleapis.com/maps/api/geocode/json', {
	      params: {
	        address: val,
	        sensor: false
	      }
	    }).then(function(response){
	      return response.data.results.map(function(item){
	        return {
	          location: item.geometry.location,
	          formatted_address: item.formatted_address
	        }
	      });
	    });
	 };
	
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
			
		if ($scope.termos == true &&
		    $scope.pessoa.nome != null &&
		    $scope.pessoa.cpf != null &&
		    $scope.pessoa.cidade != null &&
		    $scope.pessoa.email != null &&
		    $scope.pessoa.senha != null &&
		    $scope.pessoa.telefone != null) {
			
			$('body').oLoader({
			      backgroundColor:'#fff',
			      fadeInTime: 500,
			      fadeOutTime: 1000,
			      image: '/cleanUp/resources/assets/jloader/spinner.gif',
			      style: 0,
			      imageBgColor: 'none',
			      fadeLevel: 1
			 });
					
			if($scope.mostrar){
				if($scope.especialidadesDiarista.length > 0){
					
					$scope.pessoa.tipo = 0;
					$scope.pessoa.especialidades = $scope.especialidadesDiarista;
					
					$scope.pessoa.lat = $scope.asyncSelected.location.lat;
					$scope.pessoa.lng = $scope.asyncSelected.location.lng;
					$scope.pessoa.endereco = $scope.asyncSelected.formatted_address;
					
					
					if($scope.pessoa.endereco != null){
						var url = $scope.url;
						
						
						console.log($scope.pessoa.especialidades);
						$http({
				            url: url + "cadastro/add",
				            data: $scope.pessoa,
				            method: "POST",
				            headers: {'Content-Type': 'application/json'}
				        }).success(function(data) {
				        	
				        	$('body').oLoader('hide');
				        	
				        	bootbox.alert("Cadastro realizado com sucesso!", function() {
				        		location.reload();
				        	});
				        }).error(function(data) {
				        	exibirMensagemErro(data);
				       });
					}					
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
			        	
			        	$('body').oLoader('hide');
			        	
			        	bootbox.alert("Cadastro realizado com sucesso!", function() {
			        		location.reload();
			        	});
			        	
			        }).error(function(data) {
			        	
			        	$('body').oLoader('hide');
			        	
			        	exibirMensagemErro(data);
			       });				
					
			}	
			
	   }
	};

}

