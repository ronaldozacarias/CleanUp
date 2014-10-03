package br.com.cleanUp.repository;

import org.springframework.data.repository.CrudRepository;
import br.com.cleanUp.model.Servico;

public interface ServicoRepository extends CrudRepository<Servico, Integer> {
}
