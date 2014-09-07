package br.com.cleanUp.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name = "ID_DIARISTA")
public class Diarista extends Pessoa {
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="DIARISTA_ESPECIALIDADE",
			joinColumns=@JoinColumn(name="COD_PESSOA"),
			inverseJoinColumns=@JoinColumn(name="ID_ESPECIADIDADE"))
	private List<Especialidade> especialidade;

	public List<Especialidade> getEspecialidade() {
		return especialidade;
	}

	public void setEspecialidade(List<Especialidade> especialidade) {
		this.especialidade = especialidade;
	}
	
}
