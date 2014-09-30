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

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "TB_SERVICO")
public class Servico {

	@Id 
	@GeneratedValue(strategy=GenerationType.AUTO) 
	@Column(name = "COD_SERVICO")
	private Integer codServico;
	
	@Enumerated(EnumType.STRING)
    @Column(name = "TIPOSERVICO")
	private TipoServico tipoServico;
	
	@Column(name = "DESCRICAO", length = 300, nullable = false)
	private String descricao;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="CODCLIENTE", insertable=true, updatable=true)
	@Fetch(FetchMode.JOIN)
	private Cliente cliente;
	
	@ManyToOne
	@JoinColumn(name="CODDIARISTA",insertable=true, updatable=true)
	@Fetch(FetchMode.JOIN)
	private Diarista diarista;
	
	@ManyToOne
	@JoinColumn(name="CODENDERECO",insertable=true, updatable=true)
	@Fetch(FetchMode.JOIN)
	private Endereco endereco;
	
	@Column(name = "DataServico", length = 10, nullable = false) 
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataServico;
	
	@Column(name="VALOR",length = 10, nullable = false)
	private double valor;
	
	public  Servico() {
		this.diarista = new Diarista();
		this.cliente = new Cliente();
		this.endereco = new Endereco();
	}
	
	public Servico(Integer codServico, TipoServico tipoServico,
			String descricao, Cliente codCliente, Diarista codDiarista,
			Date dataServico, float valor) {
		super();
		this.codServico = codServico;
		this.tipoServico = tipoServico;
		this.descricao = descricao;
		this.cliente = codCliente;
		this.diarista = codDiarista;
		this.dataServico = dataServico;
		this.valor = valor;
	}

	public Integer getCodServico() {
		return codServico;
	}

	public void setCodServico(Integer codServico) {
		this.codServico = codServico;
	}

	public TipoServico getTipoServico() {
		return tipoServico;
	}

	public void setTipoServico(TipoServico tipoServico) {
		this.tipoServico = tipoServico;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Date getDataServico() {
		return dataServico;
	}

	public void setDataServico(Date dataServico) {
		this.dataServico = dataServico;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Diarista getDiarista() {
		return diarista;
	}

	public void setDiarista(Diarista diarista) {
		this.diarista = diarista;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
}
