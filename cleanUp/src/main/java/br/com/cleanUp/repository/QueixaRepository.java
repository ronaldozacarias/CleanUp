package br.com.cleanUp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import br.com.cleanUp.model.Queixa;

public interface QueixaRepository extends CrudRepository<Queixa, Integer>{
	
	@Query("FROM Queixa q where q.diarista.codigo=:codigoDiarista")
	List<Queixa> listaDeQueixasPorDiarista(@Param("codigoDiarista") Integer codigoDiarista);

	@Query("FROM Queixa q where q.cliente.codigo=:codigoCliente")
	List<Queixa> listaDeQueixasPorCliente(@Param("codigoCliente") Integer codigoCliente);
}
