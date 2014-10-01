package br.com.cleanUp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="TB_SERVICO_TIPO_NOTIFICACAO")
public class ServicoTipoNotificacao {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID_SERVICOTIPONOTIFICACAO")
	private int idServicoTipoNotificacao;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID_SERVICO", nullable = false)
	private Servico servico;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID_TIPONOTIFICACAO", nullable = false)
	private TipoNotificacao tipoNotificacao;

	public int getIdServicoTipoNotificacao() {
		return idServicoTipoNotificacao;
	}

	public void setIdServicoTipoNotificacao(int idServicoTipoNotificacao) {
		this.idServicoTipoNotificacao = idServicoTipoNotificacao;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public TipoNotificacao getTipoNotificacao() {
		return tipoNotificacao;
	}

	public void setTipoNotificacao(TipoNotificacao tipoNotificacao) {
		this.tipoNotificacao = tipoNotificacao;
	}
	
}
