package br.com.cleanUp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TESTE_RASTREIO")
public class Contact {

    @Id
    @GeneratedValue
    private int id;
    @Column(name = "NOME")
	private String name;
    @Column(name = "TELEFONE")
	private String phoneNumber;
	
	public Contact(){
		
	}
	
	public Contact(String name, String phoneNumber, int id) {
		super();
		this.name = name;
		this.phoneNumber = phoneNumber;
	}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

    @Override
    public boolean equals(Object object) {
        if (object instanceof Contact){
            Contact contact = (Contact) object;
            return contact.id == id;
        }

        return false;
    }

    @Override
    public int hashCode() {
        return id;
    }
}
