package br.com.cleanUp.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import br.com.cleanUp.model.Servico;

public interface ServicoRepository extends CrudRepository<Servico, Integer> {
	@Query("FROM Servico s where s.cliente.codigo =:codCliente")
	ArrayList<Servico> listarServicosPorCliente(@Param("codCliente") Integer codCliente);
}
