package br.com.cleanUp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import br.com.cleanUp.model.Menu;
import br.com.cleanUp.model.Perfil;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.MenuService;
import br.com.cleanUp.service.ServicoService;
import br.com.cleanUp.util.AtributoDeSessao;

@Controller
@RequestMapping(value = "/protected/menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	@RequestMapping(value = "/getMenu",  method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<Menu> doGetMenu() {
		
		Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		return menuService.getMenu(usuarioLogado.getPerfil());
    }

}
