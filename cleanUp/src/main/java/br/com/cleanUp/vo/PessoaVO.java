package br.com.cleanUp.vo;

import java.util.List;

import br.com.cleanUp.model.Especialidade;

public class PessoaVO {

	private String nome;
	private String cpf;
	private String telefone;
	private String endereco;
	private int cidade;
	private String email;
	private String senha;
	private boolean diarista;
	private List<Especialidade> especialidades;
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public int getCidade() {
		return cidade;
	}
	public void setCidade(int cidade) {
		this.cidade = cidade;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public boolean isDiarista() {
		return diarista;
	}
	public void setDiarista(boolean diarista) {
		this.diarista = diarista;
	}
	public List<Especialidade> getEspecialidades() {
		return especialidades;
	}
	public void setEspecialidades(List<Especialidade> especialidades) {
		this.especialidades = especialidades;
	}	

}
