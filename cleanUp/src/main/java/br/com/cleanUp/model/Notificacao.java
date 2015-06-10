package br.com.cleanUp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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
	
	@Column(name = "DESCRICAO", nullable = true)
	private String descricaoNotificacao;
	
	@Column(name = "DH_ENVIO_DA_NOTIFICACAO")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataEnvioNotificacao;
		
	@Enumerated(EnumType.STRING)
	private StatusNotificacao status;
	
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
	public String getDescricaoNotificacao() {
		return descricaoNotificacao;
	}
	public void setDescricaoNotificacao(String descricaoNotificacao) {
		this.descricaoNotificacao = descricaoNotificacao;
	}
	public Date getDataEnvioNotificacao() {
		return dataEnvioNotificacao;
	}
	public void setDataEnvioNotificacao(Date dataEnvioNotificacao) {
		this.dataEnvioNotificacao = dataEnvioNotificacao;
	}
	public StatusNotificacao getStatus() {
		return status;
	}
	public void setStatus(StatusNotificacao status) {
		this.status = status;
	}	

}
