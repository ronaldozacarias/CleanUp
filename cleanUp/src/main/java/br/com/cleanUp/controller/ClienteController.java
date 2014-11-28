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
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Especialidade;
import br.com.cleanUp.model.Favorito;
import br.com.cleanUp.model.HistoricoServico;
import br.com.cleanUp.model.Perfil;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.StatusNotificacao;
import br.com.cleanUp.model.StatusServico;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.ClienteService;
import br.com.cleanUp.service.DiaristaService;
import br.com.cleanUp.service.FavoritoService;
import br.com.cleanUp.service.HistoricoServicoService;
import br.com.cleanUp.service.ServicoService;
import br.com.cleanUp.util.AtributoDeSessao;
import br.com.cleanUp.vo.ClassificacaoVO;
import br.com.cleanUp.vo.ClienteVO;
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
	
	@Autowired
	private FavoritoService favoritoService;
	
	@Autowired
	private HistoricoServicoService historicoServicoService;
	
	@RequestMapping(value = "diaristas", method = RequestMethod.GET)
	public ModelAndView registrar() {
		return new ModelAndView("diaristas");
	}
	
	@RequestMapping(value = "/notificacoesCliente", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView doGetNoteCli() {
                
        Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		if (usuarioLogado.getPerfil().equals(Perfil.ROLE_CLIENT)) {
			return new ModelAndView("notificacoesCliente");
		} 
		
		return new ModelAndView("error");
    }
	
	@RequestMapping(value = "/perfilCliente", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView doGetPerfilCli() {
                
        Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		if (usuarioLogado.getPerfil().equals(Perfil.ROLE_CLIENT)) {
			return new ModelAndView("perfilCliente");
		} 
		
		return new ModelAndView("error");
    }
	
	@RequestMapping(value = "/resumoCliente", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView doGetResumoCli() {
                
        Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		if (usuarioLogado.getPerfil().equals(Perfil.ROLE_CLIENT)) {
			return new ModelAndView("resumoCliente");
		} 
		
		return new ModelAndView("error");
    }
	
	@RequestMapping(value = "/servicosCliente", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView doGetService() {
                
        Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		if (usuarioLogado.getPerfil().equals(Perfil.ROLE_CLIENT)) {
			return new ModelAndView("servicosCliente");
		} 
		
		return new ModelAndView("error");
    }
	
	@RequestMapping(value = "/historicoServicosCliente", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView doGetHistorico() {
                
        Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		if (usuarioLogado.getPerfil().equals(Perfil.ROLE_CLIENT)) {
			return new ModelAndView("historicoServico");
		} 
		
		return new ModelAndView("error");
    }
	
	@RequestMapping(value = "/favoritos", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView doGetFavoritos() {
                
        Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		if (usuarioLogado.getPerfil().equals(Perfil.ROLE_CLIENT)) {
			return new ModelAndView("favoritos");
		} 
		
		return new ModelAndView("error");
    }
	
	@RequestMapping(value = "/classificacao", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView doGetClassificationService() {
                
        Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		if (usuarioLogado.getPerfil().equals(Perfil.ROLE_CLIENT)) {
			return new ModelAndView("classificacao");
		} 
		
		return new ModelAndView("error");
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
	
	@RequestMapping(value = "/atualizarPerfil", method = RequestMethod.PUT, produces = "application/json")
	@ResponseBody
	public void editCliente(@RequestBody ClienteVO clienteVO) throws NegocioException {		
			
			Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);
					
			Cliente cliente = clienteService.findByIdUsuario(usuarioLogado.getId());
			
			cliente.setCidade(clienteVO.getCidade());
			cliente.setCpf(clienteVO.getCpf());
			cliente.setFotoUsuario(clienteVO.getFotoUsuario());
			cliente.setNome(clienteVO.getNome());
			cliente.setTelefone(clienteVO.getTelefone());
			cliente.getUsuario().setApelido(clienteVO.getNome());
			cliente.getUsuario().setEmail(clienteVO.getEmail());
			cliente.getUsuario().setSenha(clienteVO.getSenha());
			
			clienteService.editarCliente(cliente);

	}
	
	@RequestMapping(value = "/clienteLogado", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public ClienteVO getCliente() throws NegocioException {

		Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		if (usuarioLogado.getPerfil().equals(Perfil.ROLE_CLIENT)) {
			
			Cliente cliente = clienteService.findByIdUsuario(usuarioLogado.getId());		
			
			ClienteVO clienteVOLogado = new ClienteVO();
			
			clienteVOLogado.setCidade(cliente.getCidade());
			clienteVOLogado.setCodigo(cliente.getCodigo());
			clienteVOLogado.setCpf(cliente.getCpf());
			clienteVOLogado.setNome(cliente.getNome());
			clienteVOLogado.setEmail(cliente.getUsuario().getEmail());
			clienteVOLogado.setSenha(cliente.getUsuario().getSenha());
			clienteVOLogado.setTelefone(cliente.getTelefone());
			clienteVOLogado.setFotoUsuario(cliente.getFotoUsuario());
			
			return clienteVOLogado;
		}else{
			throw new NegocioException("Você não tem acesso a essa funcionalidade");
		}		

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
	
	@RequestMapping(value = "/listaHistorico", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<HistoricoServico> listaHistorico() throws NegocioException{
		
		Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);		

		Cliente cliente = clienteService.findByIdUsuario(usuarioLogado.getId());
		
		List<HistoricoServico> listaHistorico = historicoServicoService.listaHistoricoServicoPorCliente(cliente);
		
		return listaHistorico;
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
	
	@RequestMapping(value = "/avaliarServico", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void avaliacaoDeServico(@RequestBody ClassificacaoVO classificacaoVO) throws NegocioException{
		
		Servico servico = classificacaoVO.getServico();
		servico.setAvaliacao(classificacaoVO.getPontuacao());
		servico.setComentario(classificacaoVO.getComentario());
		servico.setStatus(StatusServico.CONCLUIDO);
		servico.getNotificacao().setStatus(StatusNotificacao.ENCERRADA);
		
		servicoService.avaliarServico(servico);
		
	}
	
	@RequestMapping(value = "/salvarFavoritos", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void salvarFavoritos(@RequestBody Diarista diarista)throws NegocioException{
		
		Favorito favorito = new Favorito();
		Cliente cliente = new Cliente();
		
		Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

			cliente = clienteService.findByIdUsuario(usuarioLogado.getId());
			favorito.setCliente(cliente);
			favorito.setDiarista(diarista);
			favoritoService.savad(favorito);

	}
	
	@RequestMapping(value = "/removeFavoritos", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void removerFavoritos(@RequestBody Favorito favorito)throws NegocioException{
		
		Favorito fav = favorito;
	
		try {
			
			favoritoService.remove(fav);
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listaDeFavoritos", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Favorito> listaDeFavoritosPorCliente()throws NegocioException{
		Cliente c = new Cliente();
		
		Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);
		try {
			c = clienteService.findByIdUsuario(usuarioLogado.getId());
			return favoritoService.listaFavoritoPorCliente(c);
		} catch (Exception e) {
			throw new NegocioException("Erro ao Listar Favoritos");
		}
	}
}
