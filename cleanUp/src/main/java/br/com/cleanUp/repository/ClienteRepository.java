package br.com.cleanUp.repository;

import org.springframework.data.repository.CrudRepository;

import br.com.cleanUp.model.Cliente;

public interface ClienteRepository extends CrudRepository<Cliente, Integer> {
	
	Cliente findByCpf(String cpf);
}
