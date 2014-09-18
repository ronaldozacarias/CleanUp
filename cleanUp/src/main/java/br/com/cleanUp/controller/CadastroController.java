package br.com.cleanUp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
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
	public void create(@ModelAttribute("pessoa") PessoaVO pessoa) {
		
		if(pessoa.getTipo()==0){
			
			/*Diarista diarista = new Diarista();
			cidade = new Cidade();
			cidade.setCodigoCidade(pessoa.getCidade());
			usuario = new Usuario();
			usuario.isAtivo();
			usuario.setEmail(pessoa.getEmail());
			usuario.setPerfil(Perfil.ROLE_DIARIST);
			usuario.setSenha(pessoa.getSenha());
			
			diarista.setCidade(cidade);
			diarista.setCpf(pessoa.getCpf());
			diarista.setEndereco(pessoa.getEndereco());
			diarista.setNome(pessoa.getNome());
			diarista.setEspecialidade(pessoa.getEspecialidades());
			diarista.setTelefone(pessoa.getTelefone());
			diarista.setUsuario(usuario);			
			
			diaristaService.saveDiarista(diarista);*/
			
			diaristaController.create(pessoa);
			
		}else{
			
			/*Cliente cliente = new Cliente();
			
			cidade = new Cidade();
			cidade.setCodigoCidade(pessoa.getCidade());
			usuario = new Usuario();
			usuario.isAtivo();
			usuario.setEmail(pessoa.getEmail());
			usuario.setPerfil(Perfil.ROLE_CLIENT);
			usuario.setSenha(pessoa.getSenha());
			
			cliente.setCidade(cidade);
			cliente.setCpf(pessoa.getCpf());
			cliente.setEndereco(pessoa.getEndereco());
			cliente.setNome(pessoa.getNome());
			cliente.setTelefone(pessoa.getTelefone());
			cliente.setUsuario(usuario);			
			
			clienteService.salvarCliente(cliente);*/
			clienteController.create(pessoa);
			
		}		
		
	}

}
