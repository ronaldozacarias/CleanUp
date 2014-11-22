package br.com.cleanUp.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="TB_RELATORIODIARISTA")
public class RelatorioDiarista {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_RELATORIODIARISTA")
	private int codigo;
	
	@Column(name="NUMERORUINS")
	private int numeroRuins;
	
	@Column(name="NUMERORUGULARES")
	private int numeroRegulares;
	
	@Column(name="NUMEROBONS")
	private int numeroBons;
	
	@ManyToOne
	@JoinColumn(name="ID_DIARISTA",insertable=true, updatable=true)
	@Fetch(FetchMode.JOIN)
	private Diarista diarista;
	
	@Column(name = "DATAGERACAORELATORIO", nullable = false) 
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataGeracao;
	
	public RelatorioDiarista() {
		super();
		this.diarista = new Diarista();
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public int getNumeroRuins() {
		return numeroRuins;
	}

	public void setNumeroRuins(int numeroRuins) {
		this.numeroRuins = numeroRuins;
	}

	public int getNumeroRegulares() {
		return numeroRegulares;
	}

	public void setNumeroRegulares(int numeroRegulares) {
		this.numeroRegulares = numeroRegulares;
	}

	public int getNumeroBons() {
		return numeroBons;
	}

	public void setNumeroBons(int numeroBons) {
		this.numeroBons = numeroBons;
	}

	public Diarista getDiarista() {
		return diarista;
	}

	public void setDiarista(Diarista diarista) {
		this.diarista = diarista;
	}

	public Date getDataGeracao() {
		return dataGeracao;
	}

	public void setDataGeracao(Date dataGeracao) {
		this.dataGeracao = dataGeracao;
	}
}
