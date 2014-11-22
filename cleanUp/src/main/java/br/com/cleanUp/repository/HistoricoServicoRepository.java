package br.com.cleanUp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import br.com.cleanUp.model.HistoricoServico;
import br.com.cleanUp.model.StatusServico;

public interface HistoricoServicoRepository extends CrudRepository<HistoricoServico, Integer> {

	@Query("FROM HistoricoServico hs where hs.diarista.codigo=:codigoDiarista")
	List<HistoricoServico> listarHistoricoServicoPorDiarista(@Param("codigoDiarista") int codigoDiarista);
	
	@Query("FROM HistoricoServico hs where hs.cliente.codigo=:codigoCliente")
	List<HistoricoServico> listarHistoricoServicoPorCliente(@Param("codigoCliente") int codigoCliente);
	
}
