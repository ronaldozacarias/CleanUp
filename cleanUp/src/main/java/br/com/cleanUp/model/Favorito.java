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
@Table(name="TB_FAVORITO")
public class Favorito {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_FAVORITO")
	private Integer codigo;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="ID_CLIENTE")
	private Cliente cliente;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="ID_DIARISTA")
	private Diarista diarista;
	
	public Favorito(){
		this.cliente = new Cliente();
		this.diarista = new Diarista(); 
	}

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
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
}
