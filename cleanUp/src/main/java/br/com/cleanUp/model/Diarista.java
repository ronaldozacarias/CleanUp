package br.com.cleanUp.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TB_DIARISTA")
public class Diarista {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.AUTO) 
	@Column(name = "ID_DIARISTA")
	private Integer codigo;
	
	@Column(name = "NOME_DIARISTA", length = 150, nullable = false)
	private String nome;
	
	@Column(name = "CPF_DIARISTA", length = 11, nullable = false)
	private String cpf;
	
	@Column(name = "TELEFONE_DIARISTA", length = 11, nullable = false)
	private String telefone;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ID_ENDERECO")
	private Endereco endereco;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ID_CIDADE")
	private Cidade cidade;

	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "usuario", insertable = true, updatable = true)
	private Usuario usuario;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="DIARISTA_ESPECIALIDADE",
			joinColumns=@JoinColumn(name="ID_DIARISTA"),
			inverseJoinColumns=@JoinColumn(name="ID_ESPECIADIDADE"))
	private List<Especialidade> especialidades;
	
	public Diarista(){
		this.usuario = new Usuario();
		this.cidade = new Cidade();
		this.especialidades = new ArrayList<Especialidade>();		
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

	public List<Especialidade> getEspecialidades() {
		return especialidades;
	}

	public void setEspecialidades(List<Especialidade> especialidades) {
		this.especialidades = especialidades;
	}
	
}
