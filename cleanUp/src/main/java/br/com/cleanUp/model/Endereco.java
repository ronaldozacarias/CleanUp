package br.com.cleanUp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Endereco {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "CODIGO")
	private Integer codigo;
	
	@Column(name = "ENDERECO", length = 150, nullable = false)
	private String endereco;
	
	@Column(name = "LATITUDE")
	private long lat;
	
	@Column(name = "LOGITUDE")
	private long log;
	
	public Endereco(){
		
	}
	
	public Endereco(String endereco){
		this.endereco = endereco;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public long getLat() {
		return lat;
	}

	public void setLat(long lat) {
		this.lat = lat;
	}

	public long getLog() {
		return log;
	}

	public void setLog(long log) {
		this.log = log;
	}
}
