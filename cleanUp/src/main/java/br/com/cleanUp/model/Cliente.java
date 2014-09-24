package br.com.cleanUp.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TB_CLIENTE")
public class Cliente {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.AUTO) 
	@Column(name = "ID_CLIENTE")
	private Integer codigo;
	
	@Column(name = "NOME_CLIENTE", length = 150, nullable = false)
	private String nome;
	
	@Column(name = "CPF_CLIENTE", length = 11, nullable = false)
	private String cpf;
	
	@Column(name = "TELEFONE_CLIENTE", length = 11, nullable = false)
	private String telefone;
	
	@Column(name = "ENDERECO_CLIENTE", length = 150, nullable = true)
	private Endereco endereco;
	
	@ManyToOne
	@JoinColumn(name = "ID_CIDADE")
	private Cidade cidade;

	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "usuario", insertable = true, updatable = true)
	private Usuario usuario;

	public Cliente() {
		this.usuario = new Usuario();
		this.cidade = new Cidade();
		this.endereco = new Endereco();
	}

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

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

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}