package br.com.cleanUp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import br.com.cleanUp.model.Notificacao;

public interface NotificacaoRepository extends CrudRepository<Notificacao, Integer>{
	
	@Query("SELECT n FROM Notificacao n WHERE n.diarista.codigo = :idDiarista AND n.status = 'PENDENTE'")
	List<Notificacao> findByTopTenNotifications(@Param("idDiarista") int idDiarista);

}
