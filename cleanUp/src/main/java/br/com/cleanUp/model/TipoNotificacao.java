package br.com.cleanUp.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="TB_TIPO_NOTIFICACAO")
public class TipoNotificacao{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID_TIPONOTIFICACAO")
	private int idTipoNotificacao;
	
	@Column(name = "DESCRICAO_TIPONOTIFICACAO")
	private String descricao;
	
	@OneToMany(mappedBy = "tipoNotificacao", fetch = FetchType.LAZY)
	private List<ServicoTipoNotificacao> ServicoTipoNotificacoes;

	public int getIdTipoNotificacao() {
		return idTipoNotificacao;
	}

	public void setIdTipoNotificacao(int idTipoNotificacao) {
		this.idTipoNotificacao = idTipoNotificacao;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public List<ServicoTipoNotificacao> getServicoTipoNotificacoes() {
		return ServicoTipoNotificacoes;
	}

	public void setServicoTipoNotificacoes(
			List<ServicoTipoNotificacao> servicoTipoNotificacoes) {
		ServicoTipoNotificacoes = servicoTipoNotificacoes;
	}
	
}
