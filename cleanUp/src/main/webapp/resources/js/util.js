function exibirMensagemErro(msg){
	if (msg != ""){
		bootbox.dialog({
    		title:"<h4 class='errorBootbox'>Atenção!</h4>",
            message: "<span class='errorBootbox'>"+msg+"</span>"
        });
//		alert(msg);
	}else{
		bootbox.dialog({
    		title:"Atenção!",
            message: "Conexão recusada pelo servidor" 
        });
//		alert(conexaoRecusadaPeloServidor);
	}
}