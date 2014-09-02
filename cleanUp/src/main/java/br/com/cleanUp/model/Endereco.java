package br.com.cleanUp.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Endereco {
	
	@Column(name = "RUA", length = 150, nullable = false)
	private String rua;
	
	@Column(name = "NUMERO", nullable = false)
	private int numero;
	
	@Column(name = "BAIRRO", length = 150, nullable = false)
	private String bairro;
	
	@Column(name = "CIDADE", length = 150, nullable = false)
	private String cidade;
	
	@Column(name = "CEP", length = 8, nullable = false)
	private String cep;

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

}
