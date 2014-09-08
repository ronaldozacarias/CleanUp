package br.com.cleanUp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Perfil;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.ClienteService;
import br.com.cleanUp.vo.ClienteVO;

@Controller
@RequestMapping(value = "/public/cadastro/")
public class cadastroController {

	@Autowired
	private ClienteService clienteService;

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
	public void create(@ModelAttribute("cliente") ClienteVO c) {
		
		Usuario usu = new Usuario();
		usu.isAtivo();
		usu.setEmail(c.getEmail());
		usu.setSenha(c.getSenha());
		usu.setPerfil(Perfil.ROLE_CLIENT);
		
		Endereco end = new Endereco();
		end.setBairro(c.getBairro());
		end.setCidade(c.getCidade());
		end.setCep(c.getCep());
		end.setNumero(Integer.parseInt(c.getNumero()));
		end.setRua(c.getRua());
		
		Cliente cli = new Cliente();
		cli.setCpf(c.getCpf());
		cli.setEndereco(end);
		cli.setNome(c.getNome());
		cli.setRg(c.getRg());
		cli.setTelefone(c.getTelefone());
		cli.setUsuario(usu);
		
		/*System.out.println("");
		System.out.println("################## " + cli.getNome().toUpperCase() + " ##################");
		System.out.println("################## " + cli.getRg() + " ##################");
		System.out.println("################## " + cli.getCpf() + " ##################");
		System.out.println("################## " + cli.getTelefone() + " ##################");
		System.out.println("################## " + cli.getEndereco().getRua() + " ##################");
		System.out.println("################## " + cli.getUsuario().getEmail() + " ##################");
		System.out.println("");
		@ModelAttribute("usuario") Usuario u, 
		   @ModelAttribute("endereco") Endereco e
		
		
		Usuario usu = u;
        usu.setPerfil(Perfil.ROLE_USER);
		Pessoa cli = new Cliente();
		cli.setUsuario(usu);
		cli.setEndereco(e);*/
		
		clienteService.salvarCliente(cli);
	}
	
//	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
//	@ResponseBody
//	public List<Contact> findByName(Contact contact){
//		return testeService.findContact(contact);
//	}
}
