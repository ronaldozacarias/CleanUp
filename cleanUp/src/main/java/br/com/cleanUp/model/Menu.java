package br.com.cleanUp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TB_MENU")
public class Menu {

	private int id;
	private String descricao;
	private String link;
	private String icone;
	private Perfil perfil;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID_MENU")
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	@Enumerated(EnumType.STRING)
    @Column(name = "PERFIL")
	public Perfil getPerfil() {
		return perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}
	
	@Column(name = "DESCRICAO_MENU")
	public String getDescricao() {
		return descricao;
	}	

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	@Column(name = "LINK_MENU")
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
	@Column(name = "ICONE_MENU")
	public String getIcone() {
		return icone;
	}
	public void setIcone(String icone) {
		this.icone = icone;
	}
	
	
}
