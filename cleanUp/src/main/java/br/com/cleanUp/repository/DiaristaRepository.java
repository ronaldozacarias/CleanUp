package br.com.cleanUp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import br.com.cleanUp.model.Diarista;

public interface DiaristaRepository extends CrudRepository<Diarista, Integer>{
	Diarista findByCpf(String cpf);
	@Query("FROM Diarista d where d.cidade.codigoCidade =:codCidade")
	List<Diarista> findByCidade(@Param("codCidade") Integer codCidade);
}
