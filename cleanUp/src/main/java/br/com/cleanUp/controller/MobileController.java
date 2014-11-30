package br.com.cleanUp.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Especialidade;
import br.com.cleanUp.model.Favorito;
import br.com.cleanUp.model.Notificacao;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.StatusNotificacao;
import br.com.cleanUp.model.StatusServico;
import br.com.cleanUp.model.TipoNotificacao;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.CidadeService;
import br.com.cleanUp.service.ClienteService;
import br.com.cleanUp.service.DiaristaService;
import br.com.cleanUp.service.EspecialidadeService;
import br.com.cleanUp.service.FavoritoService;
import br.com.cleanUp.service.ServicoService;
import br.com.cleanUp.util.AtributoDeSessao;
import br.com.cleanUp.util.Util;
import br.com.cleanUp.vo.AceitarServicoVO;
import br.com.cleanUp.vo.ClassificacaoVO;
import br.com.cleanUp.vo.ServicoVO;

@Controller
@RequestMapping(value = "/mobile")
public class MobileController {

	@Autowired
	private DiaristaController diaristaController;

	@Autowired
	private DiaristaService diaristaService;

	@Autowired
	private ServicoService servicoService;

	@Autowired
	private ServicoService servicoController;

	@Autowired
	private ClienteService clienteService;

	@Autowired
	private ClienteController clienteController;

	@Autowired
	private EspecialidadeService especialidadeService;

	@Autowired
	private CidadeService cidadeService;
	
	@Autowired
	private FavoritoService favoritoService;

	@RequestMapping(value = "/cliente/listDiaristas", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Diarista> getDiaristas() throws NegocioException {

		return diaristaController.getAll();

	}

	@RequestMapping(value = "/servico/{tipoUsuario}/{codigoUsuario}", method = RequestMethod.GET)
	@ResponseBody
	public List<Servico> ServicoPorDiaristaSimples(
			@PathVariable String tipoUsuario,
			@PathVariable Integer codigoUsuario) throws NegocioException {

		List<Servico> listaServicos = null;

		Usuario usuario = new Usuario();
		usuario.setId(codigoUsuario);

		System.out.println(usuario.getId());

		if (tipoUsuario.equals("diarista")) {
			Diarista diarista = diaristaService.findByUsuario(usuario);

			if (diarista != null) {
				listaServicos = servicoService.listServiceToDiarista(diarista
						.getCodigo());
			}
		} else {

			Cliente cliente = clienteService.findByIdUsuario(usuario.getId());
			if (cliente != null) {
				listaServicos = clienteService
						.listaDeServicoPorCliente(cliente);
			}

		}

		return listaServicos;
	}

	@RequestMapping(value = "/servico/add", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String saved(@RequestBody ServicoVO servicoVO)
			throws NegocioException {

		List<Endereco> listaE = servicoVO.getEnderecos();
		Cliente cliente = clienteService.findByIdUsuario(servicoVO.getUsuario()
				.getId());

		Servico servico = new Servico();
		Notificacao notificacao = new Notificacao();
		notificacao.setCliente(cliente);
		notificacao.setDiarista(servicoVO.getDiarista());
		notificacao.setDataEnvioNotificacao(new Date());
		notificacao
				.setDescricaoNotificacao(TipoNotificacao.SOLICITACAO_DO_CLIENTE
						.getTipoNotificacao());
		notificacao.setStatus(StatusNotificacao.PENDENTE);

		servico.setStatus(StatusServico.PENDENTE);
		servico.setNotificacao(notificacao);
		servico.setCliente(cliente);
		servico.setDiarista(servicoVO.getDiarista());
		servico.setDataServico(servicoVO.getData());
		servico.setDescricao(servicoVO.getDescricao());

		try {
			servicoService.save(servico, listaE, notificacao);
			return Util.constructJSON("register", true);
		} catch (Exception e2) {
			System.out.println(e2.getMessage());
			return Util.constructJSON("register", false, "Erro ao cadastrar.");
		}
	}

	@RequestMapping(value = "/servico/atualizacao/{acao}/{codigoServico}", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String confirmacaoServico(@PathVariable String acao, @PathVariable Integer codigoServico) {

		 if (acao.equals("aceitar")) {
			
			AceitarServicoVO aceitarServicoVO = new AceitarServicoVO();
			Servico servico = new Servico();
			ArrayList<Servico> listaServico = new ArrayList<Servico>();
			
			Servico servicoTemp = new Servico();
			servicoTemp.setCodServico(codigoServico);
			
			
			try {

				servico  = servicoService.findById(servicoTemp);
				listaServico.add(servico);
				
				aceitarServicoVO.setServicosVO(listaServico);
				
				for (int i = 0; i < aceitarServicoVO.getServicosVO().size(); i++) {
					aceitarServicoVO.getServicosVO().get(i).setStatus(StatusServico.ACEITO);
					aceitarServicoVO.getServicosVO().get(i).getNotificacao().setStatus(StatusNotificacao.CONCLUIDA);
					aceitarServicoVO.getServicosVO().get(i).getNotificacao().setDescricaoNotificacao(TipoNotificacao.CONFIRMACAO_DE_SOLICITACAO.getTipoNotificacao());
				}
				this.servicoService.edit(aceitarServicoVO.getServicosVO());
				
				return Util.constructJSON("atualizar", true,
						"Informações atualizada.");
			} catch (NegocioException e) {
				System.out.println(e.getMessage());
				return Util.constructJSON("atualizar", false,
						"Erro ao atualizar");
			}

		} else if (acao.equals("recusar") || acao.equals("cancelar") ) {

			try {

				Servico servico = new Servico();

				servico.setCodServico(codigoServico);
				servico.setDataServico(new Date());

				servicoService.cancelarServico(servico);
				return Util.constructJSON("atualizar", true,
						"Informações atualizada.");

			} catch (Exception e) {
				return Util.constructJSON("atualizar", false,
						"Erro ao atualizar");
			}
		}
			return Util.constructJSON("atualizar", false,
					"Erro ao atualizar");
	}

	@RequestMapping(value = "servico/avaliarServico", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String avaliacaoDeServico(@RequestBody ClassificacaoVO classificacaoVO) throws NegocioException{
		
		Servico servico = classificacaoVO.getServico();
		servico.setAvaliacao(classificacaoVO.getPontuacao());
		servico.setComentario(classificacaoVO.getComentario());
		servico.setStatus(StatusServico.CONCLUIDO);
		servico.getNotificacao().setStatus(StatusNotificacao.ENCERRADA);
		try{
		servicoService.avaliarServico(servico);
		return Util.constructJSON("register", true);
		} catch (Exception e2) {
			System.out.println(e2.getMessage());
			return Util.constructJSON("register", false, "Erro ao cadastrar avaliacao.");
		}
	}

	@RequestMapping(value = "/listar/especialidades", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Especialidade> listarEspecialidades() throws NegocioException {
		return especialidadeService.todasEspecialidadesList();
	}

	@RequestMapping(value = "/listar/cidades", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Cidade> listarCidades() throws NegocioException {
		return cidadeService.todasCidadesList();
	}
	
	@RequestMapping(value = "/listar/favoritos", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Diarista> listaDeFavoritosPorCliente(Usuario u)throws NegocioException{
		Cliente c = new Cliente();
		try {
			c = clienteService.findByIdUsuario(u.getId());
			List<Diarista> diaristas = null;
			List<Favorito> fav = favoritoService.listaFavoritoPorCliente(c);
			for (Favorito favorito : fav) {
				Diarista d = diaristaService.findByUsuario(favorito.getDiarista().getUsuario());
				diaristas.add(d);
			}
			return diaristas;
		} catch (Exception e) {
			throw new NegocioException("Erro ao Listar Favoritos");
		}
	}
	
	@RequestMapping(value = "/listar/addfavorito", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void salvarFavoritos(@RequestBody Favorito favorito)throws NegocioException{
			favoritoService.savad(favorito);

	}
	
	@RequestMapping(value = "/listar/removefavorito", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void removerFavoritos(@RequestBody Favorito favorito)throws NegocioException{
		try {		
			favoritoService.remove(favorito);
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
	}
}
