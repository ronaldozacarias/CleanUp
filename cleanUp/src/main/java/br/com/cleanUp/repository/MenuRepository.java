package br.com.cleanUp.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import br.com.cleanUp.model.Menu;
import br.com.cleanUp.model.Perfil;

public interface MenuRepository extends CrudRepository<Menu, Integer>{

	List<Menu> findMenuByPerfil(Perfil perfil);	

}
