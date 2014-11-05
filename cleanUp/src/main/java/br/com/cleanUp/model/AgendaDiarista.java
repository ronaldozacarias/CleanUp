package br.com.cleanUp.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="AGENDADIARISTA")
public class AgendaDiarista {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_AGENDA")
	private int codigo;
	
	@ElementCollection(fetch=FetchType.LAZY)
	@CollectionTable(name="AGENDADATAS", joinColumns=@JoinColumn(name="ID_AGENDA"))
	@Column(name="DATASAGENDA")
	private List<Date> datasAgenda;
	
	public AgendaDiarista(){
		this.datasAgenda = new ArrayList<Date>();
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public List<Date> getDatasAgenda() {
		return datasAgenda;
	}

	public void setDatasAgenda(List<Date> datasAgenda) {
		this.datasAgenda = datasAgenda;
	}
}
