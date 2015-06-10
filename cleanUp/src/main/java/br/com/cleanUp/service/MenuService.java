package br.com.cleanUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.model.Menu;
import br.com.cleanUp.model.Perfil;
import br.com.cleanUp.repository.MenuRepository;

@Service
@Transactional
public class MenuService {
	
	@Autowired
	private MenuRepository menuRepository;

	public List<Menu> getMenu(Perfil perfil) {
		return menuRepository.findMenuByPerfil(perfil);
	}
	
	

}
