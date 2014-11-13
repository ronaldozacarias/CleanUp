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
	
	@Query("FROM Servico s where s.diarista.codigo =:codDiarista")
	ArrayList<Servico> listarServicosPorDiarista(@Param("codDiarista") Integer codDiarista);

	@Query("FROM Servico s where s.cliente.codigo =:codigoCliente")
	List<Servico> listarServicoPorCliente(@Param("codigoCliente") int codigoCliente);
	
	@Query("FROM Servico s where s.diarista.codigo =:codigoDiarista AND s.cliente.codigo =:codigoCliente AND s.status = 'PENDENTE'")
	List<Servico> listarServicoPorClienteEDiarista(@Param("codigoCliente") int codigoCliente, @Param("codigoDiarista") Integer codigoDiarista);

	@Query("FROM Servico s where s.diarista.codigo =:codigoDiarista")
	List<Servico> listarServicoPorDiarista(@Param("codigoDiarista") int codigoDiarista);
}
