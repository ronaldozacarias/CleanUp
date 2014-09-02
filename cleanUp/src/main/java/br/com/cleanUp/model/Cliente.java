package br.com.cleanUp.model;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name = "ID_Cliente")
public class Cliente extends Pessoa{
	
}
