package br.com.cleanUp.repository;

import org.springframework.data.repository.CrudRepository;

import br.com.cleanUp.model.Pessoa;

public interface PessoaRepository extends CrudRepository<Pessoa, Integer> {

}
