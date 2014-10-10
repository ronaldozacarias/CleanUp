function exibirMensagemErro(msg){
	if (msg != ""){
		bootbox.dialog({
    		title:"Erro inesperado!",
            message: msg
        });
//		alert(msg);
	}else{
		bootbox.dialog({
    		title:"Erro inesperado!",
            message: conexaoRecusadaPeloServidor
        });
//		alert(conexaoRecusadaPeloServidor);
	}
}