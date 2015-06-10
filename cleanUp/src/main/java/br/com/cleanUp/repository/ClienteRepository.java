package br.com.cleanUp.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import br.com.cleanUp.model.Cliente;

public interface ClienteRepository extends CrudRepository<Cliente, Integer> {
	
	Cliente findByCpf(String cpf);
	
	@Query("SELECT c FROM Cliente c WHERE c.usuario.id = :idUsuario")
	Cliente findByIdUsuario(@Param("idUsuario") int idUsuario);	
	
	
}
