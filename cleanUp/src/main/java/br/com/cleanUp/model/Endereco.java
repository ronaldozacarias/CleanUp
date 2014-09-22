package br.com.cleanUp.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Endereco {
	
	@Column(name = "ENDERECO", length = 150, nullable = false)
	private String endereco;
	
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
	
}
