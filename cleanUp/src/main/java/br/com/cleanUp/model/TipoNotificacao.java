package br.com.cleanUp.model;

public enum TipoNotificacao {
	
    SOLICITACAO_DO_CLIENTE("quer contrata-la"), 
    CANCELAMENTO_DO_CLIENTE("cancelou a solicitacao"),
    SOLICITACAO_CLIENTE_PENDENTE("esta aguardando sua confimacao"),
    CONFIRMACAO_DE_SERVICO_PELO_CLIENTE("Sua solicitacao foi confirmada"),
    CONFIRMACAO_DE_SOLICITACAO("aceitou sua solicitacao"),
    CANCELAMENTO_DE_SOLICITACAO("Sua solicitacao foi cancelada"),;

    TipoNotificacao(String tipoNotificacao){
        this.tipoNotificacao = tipoNotificacao;
    }

    private String tipoNotificacao;

    public String getTipoNotificacao() {
        return tipoNotificacao;
    }
	
}
