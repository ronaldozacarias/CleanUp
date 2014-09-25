app.directive('ngConfirmClick',[
     function() {
       return {
         link: function(scope, element, attr) {
           var msg = attr.ngConfirmClick || "Are you sure?";
           var clickAction = attr.confirmedClick;
           element.bind('click', function(event) {
             if (window.confirm(msg)) {
               scope.$apply(clickAction)
             }
           });
         }
       };
     }
]);

app.directive('sameAs', function() {
	  return {
	    require: 'ngModel',
	    link: function(scope, elm, attrs, ctrl) {
	      ctrl.$parsers.unshift(function(viewValue) {	    	  
	    	  if (viewValue === scope[attrs.sameAsForm][attrs.sameAs].$viewValue) {
	    		  //ctrl.$setValidity('sameAs', true);
	    		  scope[attrs.sameAsForm].$error.sameAs = true;  
	    		  return viewValue;
	        } else {
	        	  scope[attrs.sameAsForm].$error.sameAs = false;  
	        	  return undefined;
	        }
	      });
	    }
	  };
});


function exibirMensagemErro(msg){
	if (msg != ""){
		alert(msg);
	}else{
		alert(conexaoRecusadaPeloServidor);
	}
}