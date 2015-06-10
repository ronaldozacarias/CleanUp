package br.com.cleanUp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import br.com.cleanUp.model.Favorito;

public interface FavoritoRepository extends CrudRepository<Favorito, Integer>{

	@Query("FROM Favorito f where f.cliente.codigo=:codigoCliente")
	List<Favorito> listarFavoritoPorCliente(@Param("codigoCliente") Integer codigoCliente);
		
	@Query("FROM Favorito f where f.diarista.codigo=:codigoDiarista and f.cliente.codigo=:codigoCliente")
	Favorito favoritoPorDiarista(@Param("codigoDiarista") Integer codigoDiarista, @Param("codigoCliente") Integer codigoCliente);
}
