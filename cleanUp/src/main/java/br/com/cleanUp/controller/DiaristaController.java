package br.com.cleanUp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Pessoa;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.DiaristaService;

@Controller
@RequestMapping(value = "/public/registrarDiarista")
public class DiaristaController {
	
	@Autowired
	private DiaristaService diaristaService;
	
	@RequestMapping(method = RequestMethod.GET)
    public ModelAndView registrar() {
        return new ModelAndView("registrar");
    }

	@RequestMapping(method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
    public void create(@ModelAttribute("pessoa") Pessoa p, 
    				   @ModelAttribute("usuario") Usuario u, 
    				   @ModelAttribute("endereco") Endereco e) {
        
		Pessoa cli = new Cliente();
		cli.setUsuario(u);
		cli.setEndereco(e);		
		
		diaristaService.saveDiarista((Diarista) p);

    }
	
	@RequestMapping(method = RequestMethod.PUT, produces = "application/json")
	@ResponseBody
    public void edit(@ModelAttribute("pessoa") Pessoa p, 
    				   @ModelAttribute("usuario") Usuario u, 
    				   @ModelAttribute("endereco") Endereco e) {
        
		Pessoa cli = new Cliente();
		cli.setUsuario(u);
		cli.setEndereco(e);		
		
		diaristaService.editDiarista((Diarista) p);

    }
	
	@RequestMapping(method = RequestMethod.DELETE, produces = "application/json")
	@ResponseBody
    public void delete(@ModelAttribute("pessoa") Diarista id) {
			
		diaristaService.removeDiarista(id);

    }
	
	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
    public List<Diarista> getAll() {
			
		return  diaristaService.listToDiarista();

    }
}
