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

import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Perfil;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.ClienteService;
import br.com.cleanUp.vo.PessoaVO;

@Controller
@RequestMapping(value = "/public/cliente")
public class ClienteController {

	Usuario usuario;
	Cidade cidade;
	Cliente cliente;
	Endereco endereco;
	
	@Autowired
	private ClienteService clienteService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView registrar() {
		return new ModelAndView("registrar");
	}

	@RequestMapping(value = "add", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void create(@RequestBody PessoaVO pessoa) {
		
		endereco = new Endereco();
		endereco.setEndereco(pessoa.getEndereco());
		
		cliente = new Cliente();		
		
		cidade = new Cidade();
		cidade.setCodigoCidade(Integer.parseInt(pessoa.getCidade()));
		usuario = new Usuario();
		usuario.isAtivo();
		usuario.setEmail(pessoa.getEmail());
		usuario.setApelido(pessoa.getNome());
		usuario.setPerfil(Perfil.ROLE_CLIENT);
		usuario.setSenha(pessoa.getSenha());
		
		cliente.setCidade(cidade);
		cliente.setCpf(pessoa.getCpf());
		cliente.setEndereco(endereco);
		cliente.setNome(pessoa.getNome());
		cliente.setTelefone(pessoa.getTelefone());
		cliente.setUsuario(usuario);			
		
		clienteService.salvarCliente(cliente);
	}

	@RequestMapping(method = RequestMethod.PUT, produces = "application/json")
	@ResponseBody
	public void edit(@ModelAttribute("pessoa") PessoaVO pessoa) {
		
		endereco = new Endereco();
		endereco.setEndereco(pessoa.getEndereco());

		cliente = new Cliente();		
		
		cidade = new Cidade();
		cidade.setCodigoCidade(Integer.parseInt(pessoa.getCidade()));
		usuario = new Usuario();
		usuario.isAtivo();
		usuario.setEmail(pessoa.getEmail());
		usuario.setPerfil(Perfil.ROLE_CLIENT);
		usuario.setSenha(pessoa.getSenha());
		
		cliente.setCidade(cidade);
		cliente.setCpf(pessoa.getCpf());
		cliente.setEndereco(endereco);
		cliente.setNome(pessoa.getNome());
		cliente.setTelefone(pessoa.getTelefone());
		cliente.setUsuario(usuario);

		clienteService.editarCliente(cliente);

	}

	@RequestMapping(method = RequestMethod.DELETE, produces = "application/json")
	@ResponseBody
	public void delete(@ModelAttribute("pessoa") Cliente id) {

		clienteService.removerCliente(id);

	}

	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Cliente> getAll() {

		return clienteService.listCliente();

	}

}
