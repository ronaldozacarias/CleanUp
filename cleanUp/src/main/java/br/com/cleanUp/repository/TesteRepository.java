package br.com.cleanUp.repository;

import org.springframework.data.repository.CrudRepository;
import br.com.cleanUp.model.Contact;

public interface TesteRepository extends CrudRepository<Contact, Integer>{
	
//	@Query("SELECT c FROM Contact c WHERE c.name LIKE :'name%'")
//	List<Contact> findContactsByName(@Param("name") String name);
}
