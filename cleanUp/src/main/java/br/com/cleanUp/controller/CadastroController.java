package br.com.cleanUp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.model.Especialidade;
import br.com.cleanUp.service.CidadeService;
import br.com.cleanUp.service.EspecialidadeService;
import br.com.cleanUp.vo.PessoaVO;

@Controller
@RequestMapping(value = "/public/cadastro/")
public class CadastroController {

//	@Autowired
//	private ClienteService clienteService;
//	
//	@Autowired
//	private DiaristaService diaristaService;
	
	@Autowired
	private DiaristaController diaristaController;
	
	@Autowired
	private ClienteController clienteController;
	
	@Autowired
	private CidadeService cidadeService;
	
	@Autowired
	private EspecialidadeService especialidadeService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome() {
		return new ModelAndView("cadastro");
	}

//	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
//	@ResponseBody
//	public List<Contact> listAll() {
//		
//		return clienteService.findAllContacts();
//	}

	@RequestMapping(value = "add", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void create(@RequestBody PessoaVO pessoa) throws NegocioException {
		
		if(pessoa.getTipo()==0){			
			diaristaController.create(pessoa);			
		}else{			
			clienteController.create(pessoa);			
		}
		
	}
	
	@RequestMapping(value = "getCidades", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody		
	public List<Cidade> todasCidades(){
		
		List<Cidade> listaDeCidades = cidadeService.todasCidadesList();
		
		return listaDeCidades;
		
	}
	
	@RequestMapping(value = "getEspecialidades", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody		
	public List<Especialidade> todasEspecialidades(){
		
		List<Especialidade> listaDeEspecialidades = especialidadeService.todasEspecialidadesList();
		
		return listaDeEspecialidades;
		
	}

}
