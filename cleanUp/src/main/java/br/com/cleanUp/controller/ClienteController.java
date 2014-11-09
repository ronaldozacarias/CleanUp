package br.com.cleanUp.controller;

import java.util.ArrayList;
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
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Especialidade;
import br.com.cleanUp.model.Perfil;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.StatusNotificacao;
import br.com.cleanUp.model.StatusServico;
import br.com.cleanUp.model.TipoNotificacao;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.ClienteService;
import br.com.cleanUp.service.DiaristaService;
import br.com.cleanUp.service.ServicoService;
import br.com.cleanUp.vo.AceitarServicoVO;
import br.com.cleanUp.vo.AvaliarServicoVO;
import br.com.cleanUp.vo.PessoaVO;

@Controller
@RequestMapping(value = "/protected/cliente")
public class ClienteController {

	Usuario usuario;
	Cidade cidade;
	Cliente cliente;
	Endereco endereco;

	@Autowired
	private ClienteService clienteService;
	
	@Autowired
	private DiaristaController diaristaController;
	
	@Autowired
	private DiaristaService diaristaServico;
	
	@Autowired
	private ServicoService servicoService;
	
	@RequestMapping(value = "diaristas", method = RequestMethod.GET)
	public ModelAndView registrar() {
		return new ModelAndView("diaristas");
	}

	@RequestMapping(value = "add", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void create(@RequestBody PessoaVO pessoa) throws NegocioException {

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
		cliente.setNome(pessoa.getNome());
		cliente.setTelefone(pessoa.getTelefone());
		cliente.setUsuario(usuario);

		clienteService.salvarCliente(cliente);
	}

	@RequestMapping(method = RequestMethod.PUT, produces = "application/json")
	@ResponseBody
	public void edit(@ModelAttribute("pessoa") PessoaVO pessoa)
			throws NegocioException {

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
		cliente.setNome(pessoa.getNome());
		cliente.setTelefone(pessoa.getTelefone());
		cliente.setUsuario(usuario);

		clienteService.editarCliente(cliente);

	}

	@RequestMapping(method = RequestMethod.DELETE, produces = "application/json")
	@ResponseBody
	public void delete(@ModelAttribute("pessoa") Cliente id)
			throws NegocioException {

		clienteService.removerCliente(id);

	}

	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Cliente> getAll() throws NegocioException {

		return clienteService.listCliente();

	}
	
	@RequestMapping(value = "diaristas/listDiaristas", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Diarista> getAllDiaristas() throws NegocioException {

		return diaristaController.getAll();

	}
	
	@RequestMapping(value = "listaServicoPorCliente", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public ArrayList<Servico> listaServicoPorDiarista(Cliente c){
		ArrayList<Servico> listaS = new ArrayList<Servico>();
		Cliente c1 = new Cliente();
		c1.setCodigo(1);
		try {
			listaS = clienteService.listaDeServicoPorCliente(c1);
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
		return listaS;
	}
	
	@RequestMapping(value = "listaDeDiaristaPorEspecialidade", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Diarista> listarDiaristaPorEspecialidade(/*Especialidade e*/){
		ArrayList<Diarista> listaDiaristaPorEspecialidade = new ArrayList<Diarista>();
		Especialidade e = new Especialidade();
		e.setCodigoEspecialidade(4);
		try {
			listaDiaristaPorEspecialidade = (ArrayList<Diarista>) this.diaristaServico.listaDeDiaristaPorEspecialidade(e);
		} catch (NegocioException e2) {
			System.out.println(e2.getMessage());
		}
		return listaDiaristaPorEspecialidade;
	}

	public Cliente findByCpf(String cpf) throws NegocioException {
		return clienteService.findByCpf(cpf);
	}
	
	@RequestMapping(value = "avaliarServico", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public void avaliacaoDeServico(/*@RequestBody AvaliarServicoVO avaliarServicoVO*/) throws NegocioException{
		AvaliarServicoVO avaliarServicoVO = new AvaliarServicoVO();
		Servico s = new Servico();
		s.setCodServico(26);
		s = servicoService.findById(s);
		ArrayList<Servico> lista = new ArrayList<Servico>();
		lista.add(s);
		avaliarServicoVO.setServicosVO(lista);
		try {
			for (int i = 0; i < avaliarServicoVO.getServicosVO().size(); i++) {
				avaliarServicoVO.getServicosVO().get(i).setStatus(StatusServico.CONCLUIDO);
				avaliarServicoVO.getServicosVO().get(i).getNotificacao().setStatus(StatusNotificacao.CONCLUIDA);
				avaliarServicoVO.getServicosVO().get(i).getNotificacao().setDescricaoNotificacao(TipoNotificacao.CONFIRMACAO_DE_SOLICITACAO.getTipoNotificacao());
				avaliarServicoVO.getServicosVO().get(i).setNotaDoServico(1);
			}
			this.servicoService.avaliarServico(avaliarServicoVO.getServicosVO());
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
	}
}
