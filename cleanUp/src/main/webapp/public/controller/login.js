function loginController($scope, $location) {
	console.log("[CONSOLE INICIADO]");
    var url = "" + $location.$$absUrl;
    $scope.displayLoginError = (url.indexOf("error") >= 0);
    
    $scope.spinner = function(){
    	$('body').oLoader({
		      backgroundColor:'#fff',
		      fadeInTime: 500,
		      fadeOutTime: 1000,
		      image: '/cleanUp/resources/assets/jloader/spinner.gif',
		      style: 0,
		      imageBgColor: 'none',
		      fadeLevel: 1
		 }); 
    };
    
}