package br.com.cleanUp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TB_CIDADE")
public class Cidade {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID_CIDADE")
	private int codigoCidade;
	@Column(name = "CIDADE")
	private String cidade;
	
	public int getCodigoCidade() {
		return codigoCidade;
	}
	public void setCodigoCidade(int codigoCidade) {
		this.codigoCidade = codigoCidade;
	}
	public String getNomeCidade() {
		return cidade;
	}
	public void setNomeCidade(String nomeCidade) {
		this.cidade = nomeCidade;
	}	

}
