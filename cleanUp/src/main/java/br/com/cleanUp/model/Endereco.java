package br.com.cleanUp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TB_ENDERECO")
public class Endereco {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "ID_ENDERECO")
	private Integer codigo;
	
	@Column(name = "LOGRADOURO", length = 150, nullable = false)
	private String logradouro;
	
	@Column(name = "LATITUDE")
	private long lat;
	
	@Column(name = "LOGITUDE")
	private long log;
	
	public Endereco(){
		
	}
	
	public Endereco(String logradouro){
		this.logradouro = logradouro;
	}

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
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
