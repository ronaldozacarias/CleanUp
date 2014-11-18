package br.com.cleanUp.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="TB_QUEIXA")
public class Queixa {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_QUEIXA")
	private int codigo;
	
	@ManyToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="ID_DIARISTA")
	private Diarista diarista;
	
	@ManyToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="ID_CLIENTE")
	private Cliente cliente;
	
	@ElementCollection(fetch=FetchType.LAZY)
	@CollectionTable(name="MENSAGENS_QUEIXAS", joinColumns=@JoinColumn(name="ID_QUEIXA"))
	@Column(name="MENSAGENS")
	private List<String> mensagem;

	public Queixa() {
		super();
		this.cliente = new Cliente();
		this.diarista = new Diarista();
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public Diarista getDiarista() {
		return diarista;
	}

	public void setDiarista(Diarista diarista) {
		this.diarista = diarista;
	}

	public List<String> getMensagem() {
		return mensagem;
	}

	public void setMensagem(List<String> mensagem) {
		this.mensagem = mensagem;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
}
