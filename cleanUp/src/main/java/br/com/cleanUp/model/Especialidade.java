package br.com.cleanUp.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ESPECIALIDADE")
public class Especialidade {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "ID_ESPECIADIDADE")
	private Integer codigoEspecialidade;
	
	@Column(name = "NOMEESPECIALIDADE")
	private String nomeEspecialidade;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="DIARISTA_ESPECIALIDADE", joinColumns=@JoinColumn(name="ID_ESPECIADIDADE"),
	inverseJoinColumns=@JoinColumn(name="ID_DIARISTA"))
	private List<Diarista> diaristas;
	
	
	public Especialidade() {
		this.diaristas = new ArrayList<Diarista>();
	}
	
	public Integer getCodigoEspecialidade() {
		return codigoEspecialidade;
	}
	public void setCodigoEspecialidade(Integer codigoEspecialidade) {
		this.codigoEspecialidade = codigoEspecialidade;
	}
	public String getNomeEspecialidade() {
		return nomeEspecialidade;
	}
	public void setNomeEspecialidade(String nomeEspecialidade) {
		this.nomeEspecialidade = nomeEspecialidade;
	}
		
}
