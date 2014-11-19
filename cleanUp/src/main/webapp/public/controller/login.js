function loginController($scope, $location) {
	console.log("[CONSOLE INICIADO]");
    var url = "" + $location.$$absUrl;
    $scope.displayLoginError = (url.indexOf("error") >= 0);
}