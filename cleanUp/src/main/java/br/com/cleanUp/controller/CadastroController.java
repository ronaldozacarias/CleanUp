package br.com.cleanUp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Especialidade;
import br.com.cleanUp.service.CidadeService;
import br.com.cleanUp.service.EspecialidadeService;
import br.com.cleanUp.service.UsuarioService;
import br.com.cleanUp.util.Util;
import br.com.cleanUp.vo.PessoaVO;

@Controller
@RequestMapping(value = "/public/cadastro/")
public class CadastroController {

	@Autowired
	private DiaristaController diaristaController;
	
	@Autowired
	private ClienteController clienteController;
	
	@Autowired
	private CidadeService cidadeService;
	
	@Autowired
	private EspecialidadeService especialidadeService;

	@Autowired
	private UsuarioService usuarioService;

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

	@RequestMapping(value = "mobile/add", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String addMobile(@RequestBody PessoaVO pessoa) {

		try {

			if (pessoa.getTipo() == 0) {
				for (int i = 0; i < pessoa.getEspecialidades().length; i++) {
					System.out.println(pessoa.getEspecialidades()[i]);
				}
			}

			if (pessoa.getTipo() == 0) {

				if (diaristaController.findByCpf(pessoa.getCpf()) != null) {
					return Util.constructJSON("register", false,
							"cpf_cadastrado");
				} else if (usuarioService.findByEmail(pessoa.getEmail()) != null) {
					return Util.constructJSON("register", false,
							"email_cadastrado");
				} else {
					diaristaController.create(pessoa);
					return Util.constructJSON("register", true);
				}

			} else {
				if (clienteController.findByCpf(pessoa.getCpf()) != null) {
					return Util.constructJSON("register", false,
							"cpf_cadastrado");
				} else if (usuarioService.findByEmail(pessoa.getEmail()) != null) {
					return Util.constructJSON("register", false,
							"email_cadastrado");
				} else {
					clienteController.create(pessoa);
					return Util.constructJSON("register", true);
				}
			}
		} catch (Exception e) {
			return Util.constructJSON("register", false, "Erro ao cadastrar.");
		}

	}
}
