package br.com.cleanUp.model;

public enum TipoNotificacao {
	
    SOLICITACAO_DO_CLIENTE("quer contratá-la"), 
    CANCELAMENTO_DO_CLIENTE("cancelou a solicitação"),
    SOLICITACAO_CLIENTE_PENDENTE("esta aguardando sua confimação"),
    CONFIRMACAO_DE_SERVICO_PELO_CLIENTE("Sua solicitação foi confirmada"),
    CONFIRMACAO_DE_SOLICITACAO("Sua solicitação foi confirmada"),
    CANCELAMENTO_DE_SOLICITACAO("Sua solicitação foi confirmada"),;

    TipoNotificacao(String tipoNotificacao){
        this.tipoNotificacao = tipoNotificacao;
    }

    private String tipoNotificacao;

    public String getTipoNotificacao() {
        return tipoNotificacao;
    }
	
}
