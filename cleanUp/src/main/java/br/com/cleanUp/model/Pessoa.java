package br.com.cleanUp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Inheritance(strategy=InheritanceType.JOINED)
public abstract class Pessoa {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.AUTO) 
	@Column(name = "COD_PESSOA")
	private Integer codigo;
	
	@Column(name = "NomePessoa", length = 50, nullable = false)
	private String nome;
	
	@Column(name = "CPFPessoa", length = 11, nullable = false)
	private String cpf;
	
	@Column(name = "RGPessoa", length = 7, nullable = false)
	private String rg;
		
	@Column(name = "TelefonPessoa", length = 13, nullable = true)
	private String telefone;
	
	@Column(name = "DataNascimentoPessoa", length = 10, nullable = false) 
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataNascimento;
	
	private Endereco endereco;
	
	@OneToOne
	@JoinColumn(name = "Usuario")
	private Usuario usuario;

	public Pessoa() {
		super();
		this.endereco = new Endereco();
		this.usuario = new Usuario();
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

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
}
