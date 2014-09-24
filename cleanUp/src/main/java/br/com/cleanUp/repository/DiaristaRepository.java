package br.com.cleanUp.repository;

import org.springframework.data.repository.CrudRepository;

import br.com.cleanUp.model.Diarista;

public interface DiaristaRepository extends CrudRepository<Diarista, Integer>{
	Diarista findByCpf(String cpf);
}
