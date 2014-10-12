package br.com.cleanUp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "TB_NOTIFICACAO")
public class Notificacao {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "ID_NOTIFICACAO")
	private int idNotificacao;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "ID_DIARISTA")
	private Diarista diarista;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "ID_CLIENTE")
	private Cliente cliente;
	
	@Column(name = "NOTIFICACAO_DIARISTA", nullable = true)
	private String notificacaoDiarista;
	
	@Column(name = "NOTIFICACAO_CLIENTE", nullable = true)
	private String notificacaoCiente;
	
	@Column(name = "DH_ENVIO_DA_NOTIFICACAO")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataEnvioNotificacao;
	
	@Column(name = "DH_VISUALIZACAO_DA_NOTIFICACAO", nullable = true)
	@Temporal(TemporalType.TIMESTAMP)
	private Date visualizacaoNotificaao;
	
	public int getIdNotificacao() {
		return idNotificacao;
	}
	public void setIdNotificacao(int idNotificacao) {
		this.idNotificacao = idNotificacao;
	}
	public Diarista getDiarista() {
		return diarista;
	}
	public void setDiarista(Diarista diarista) {
		this.diarista = diarista;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public String getNotificacaoDiarista() {
		return notificacaoDiarista;
	}
	public void setNotificacaoDiarista(String notificacaoDiarista) {
		this.notificacaoDiarista = notificacaoDiarista;
	}
	public String getNotificacaoCiente() {
		return notificacaoCiente;
	}
	public void setNotificacaoCiente(String notificacaoCiente) {
		this.notificacaoCiente = notificacaoCiente;
	}
	public Date getDataEnvioNotificacao() {
		return dataEnvioNotificacao;
	}
	public void setDataEnvioNotificacao(Date dataEnvioNotificacao) {
		this.dataEnvioNotificacao = dataEnvioNotificacao;
	}
	public Date getVisualizacaoNotificaao() {
		return visualizacaoNotificaao;
	}
	public void setVisualizacaoNotificaao(Date visualizacaoNotificaao) {
		this.visualizacaoNotificaao = visualizacaoNotificaao;
	}	

}
