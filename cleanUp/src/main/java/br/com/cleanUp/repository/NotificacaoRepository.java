package br.com.cleanUp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import br.com.cleanUp.model.Notificacao;

public interface NotificacaoRepository extends CrudRepository<Notificacao, Integer>{
	
	@Query("SELECT n FROM Notificacao n WHERE n.diarista.codigo = :idDiarista AND n.status = 'PENDENTE' order by n.dataEnvioNotificacao desc")
	List<Notificacao> findByTopTenNotifications(@Param("idDiarista") int idDiarista/*, Pageable pageable*/);

	@Query("SELECT n FROM Notificacao n WHERE n.cliente.codigo = :idCliente AND n.status != 'ENCERRADA' AND n.status != 'PENDENTE' AND n.status != 'SERVICO_CANCELADO' order by n.dataEnvioNotificacao asc")
	List<Notificacao> findNotificacoesCliente(@Param("idCliente") int idCliente);

}
