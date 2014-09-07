package br.com.cleanUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.model.Contact;
import br.com.cleanUp.repository.TesteRepository;

@Service
@Transactional
public class TesteService {

	@Autowired
	private TesteRepository testeRepo;
	
	public void save(Contact contact){
		testeRepo.save(contact);
	}
	
	public List<Contact> findAllContacts() {
		
		return (List<Contact>) testeRepo.findAll();
	}
	
//	public List<Contact> findContact(Contact contact) {
		
//		return testeRepo.findContactsByName(contact.getName());
//	}
}
