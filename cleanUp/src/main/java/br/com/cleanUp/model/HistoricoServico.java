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
@Table(name="TB_HISTORICOSERVICO")
public class HistoricoServico {

	@Id 
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_HISTORIOCO")
	private Integer codigo;
	
	@Column(name = "ID_SERVICO")
	private Integer codServico;
	
	@Enumerated(EnumType.STRING)
    @Column(name = "TIPOSERVICO")
	private TipoServico tipoServico;
	
	@Column(name = "DESCRICAO", length = 300, nullable = false)
	private String descricao;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="ID_CLIENTE", insertable=true, updatable=true)
	@Fetch(FetchMode.JOIN)
	private Cliente cliente;
	
	@ManyToOne
	@JoinColumn(name="ID_DIARISTA",insertable=true, updatable=true)
	@Fetch(FetchMode.JOIN)
	private Diarista diarista;
	
	@ManyToOne
	@JoinColumn(name="ID_ENDERECO",insertable=true, updatable=true)
	@Fetch(FetchMode.JOIN)
	private Endereco endereco;
	
	@Column(name = "DATASERVICO", length = 10, nullable = false) 
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataServico;
	
	@Column(name="VALOR",length = 10, nullable = false)
	private double valor;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "STATUS")
	private StatusServico status;

	@Column(name = "DATAALERACAO", length = 10, nullable = false) 
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataAlteracao;
	
	@Column(name = "AVALIACAO", nullable = true)
	private int avaliacao;
	
	@Column(name = "COMENTARIO_AVALIACAO")
	private String comentario;

	@Column(name = "CLASSE_TIMELINE")
	private String classeTimeline;
	
	@Column(name = "CLASSE_POPOVER")
	private String classePopover;

	public HistoricoServico() {
		super();
		this.diarista = new Diarista();
		this.cliente = new Cliente();
	}

	public String getClasseTimeline() {
		return classeTimeline;
	}



	public void setClasseTimeline(String classeTimeline) {
		this.classeTimeline = classeTimeline;
	}



	public String getClassePopover() {
		return classePopover;
	}



	public void setClassePopover(String classePopover) {
		this.classePopover = classePopover;
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

	public StatusServico getStatus() {
		return status;
	}

	public void setStatus(StatusServico status) {
		this.status = status;
	}

	public Date getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(Date dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public int getAvaliacao() {
		return avaliacao;
	}

	public void setAvaliacao(int avaliacao) {
		this.avaliacao = avaliacao;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
}