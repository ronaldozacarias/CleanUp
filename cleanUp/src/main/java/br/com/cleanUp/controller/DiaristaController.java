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
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Especialidade;
import br.com.cleanUp.model.HistoricoServico;
import br.com.cleanUp.model.Perfil;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.StatusNotificacao;
import br.com.cleanUp.model.StatusServico;
import br.com.cleanUp.model.TipoNotificacao;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.DiaristaService;
import br.com.cleanUp.service.EspecialidadeService;
import br.com.cleanUp.service.HistoricoServicoService;
import br.com.cleanUp.service.ServicoService;
import br.com.cleanUp.util.AtributoDeSessao;
import br.com.cleanUp.vo.AceitarServicoVO;
import br.com.cleanUp.vo.DiaristaVO;
import br.com.cleanUp.vo.PessoaVO;

@Controller
@RequestMapping(value = "/protected/diarista")
public class DiaristaController {

	Diarista diarista;
	Usuario usuario;
	Cidade cidade;
	Endereco endereco;
	Integer idDiarista;	
	ArrayList<Servico> listaDeServicoPorDiarista = new ArrayList<Servico>();

	@Autowired
	private DiaristaService diaristaService;

	@Autowired
	private EspecialidadeService especialidadeService;
	
	@Autowired
	private ServicoService servicoService;
	
	@Autowired
	private HistoricoServicoService historicoServicoService;
	
	@RequestMapping(value = "/notificacoes", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView doGetDiarista() {
		
		Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		if (usuarioLogado.getPerfil().equals(Perfil.ROLE_DIARIST)) {
			return new ModelAndView("notificacoes");
		} 
		
		return new ModelAndView("error");
    }
	
	@RequestMapping(value = "/historicoServicosDir", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView doGetHistoricoDir() {
                
        Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		if (usuarioLogado.getPerfil().equals(Perfil.ROLE_DIARIST)) {
			return new ModelAndView("historicoServicoDir");
		} 
		
		return new ModelAndView("error");
    }
	
	@RequestMapping(value = "/perfilDiarista", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView doGetPerfilDir() {
                
        Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		if (usuarioLogado.getPerfil().equals(Perfil.ROLE_DIARIST)) {
			return new ModelAndView("perfilDia");
		} 
		
		return new ModelAndView("error");
    }
	
	@RequestMapping(value = "/resumoDiarista", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView doGetResumoDiarista() {
		
		Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		if (usuarioLogado.getPerfil().equals(Perfil.ROLE_DIARIST)) {
			return new ModelAndView("resumoDiarista");
		} 
		
		return new ModelAndView("error");
    }
	
	@RequestMapping(value = "/servicos", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView doGetServicos() {
        return new ModelAndView("servicosDiarista");
    }

	@RequestMapping(method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void create(@RequestBody PessoaVO pessoa) throws NegocioException {
		
		ArrayList<Especialidade> especialidadeDiarista = new ArrayList<Especialidade>();
		Especialidade espe;
		endereco = new Endereco();
		endereco.setLogradouro(pessoa.getEndereco());
		endereco.setLat(pessoa.getLat());
		endereco.setLng(pessoa.getLng());
		//
		for (int i = 0; i < pessoa.getEspecialidades().length; i++) {
			espe = new Especialidade();
			espe.setCodigoEspecialidade(pessoa.getEspecialidades()[i]);
			especialidadeDiarista.add(espe);
		}

		diarista = new Diarista();
		cidade = new Cidade();
		cidade.setCodigoCidade(Integer.parseInt(pessoa.getCidade()));
		usuario = new Usuario();
		usuario.isAtivo();
		usuario.setEmail(pessoa.getEmail());
		usuario.setApelido(pessoa.getNome());
		usuario.setPerfil(Perfil.ROLE_DIARIST);
		usuario.setSenha(pessoa.getSenha());

		diarista.setCidade(cidade);
		diarista.setCpf(pessoa.getCpf());
		diarista.setEndereco(endereco);
		diarista.setNome(pessoa.getNome());
		diarista.setEspecialidades(especialidadeDiarista);
		diarista.setTelefone(pessoa.getTelefone());
		diarista.setUsuario(usuario);
		diarista.setFotoUsuario("/cleanUp/resources/assets/img/avatar.jpg");

		diaristaService.saveDiarista(diarista);

	}
	
	@RequestMapping(value = "/atualizarPerfil", method = RequestMethod.PUT, produces = "application/json")
	@ResponseBody
	public void editDiarista(@RequestBody DiaristaVO diaristaVO) throws NegocioException {		
			
			Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);
					
			Diarista diarista = diaristaService.findByUsuario(usuarioLogado);
			
			List<Especialidade> newEspecialidades = new ArrayList<Especialidade>();

			diarista.setCidade(diaristaVO.getCidade());
			diarista.setCpf(diaristaVO.getCpf());
			diarista.setFotoUsuario(diaristaVO.getFotoUsuario());
			diarista.setNome(diaristaVO.getNome());
			diarista.getEndereco().setLat(diaristaVO.getEndereco().getLat());
			diarista.getEndereco().setLng(diaristaVO.getEndereco().getLng());
			diarista.getEndereco().setLogradouro(diaristaVO.getEndereco().getLogradouro());
			diarista.setTelefone(diaristaVO.getTelefone());
			diarista.getUsuario().setApelido(diaristaVO.getNome());
			diarista.getUsuario().setEmail(diaristaVO.getUsuario().getEmail());
			diarista.getUsuario().setSenha(diaristaVO.getUsuario().getSenha());
			
			for(int i = 0 ; i < diaristaVO.getNewEspecialidade().length; i++){
				Especialidade especialidade = especialidadeService.getEspecialidade(diaristaVO.getNewEspecialidade()[i]);
				newEspecialidades.add(especialidade);
			}
			
			diarista.setEspecialidades(newEspecialidades);
					
			diaristaService.editarDiarista(diarista);

	}
	
	@RequestMapping(value = "/diaristaLogada", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public DiaristaVO getDiarista() throws NegocioException {

		Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);

		if (usuarioLogado.getPerfil().equals(Perfil.ROLE_DIARIST)) {
			
			Diarista diarista = diaristaService.findByUsuario(usuarioLogado);
			
			DiaristaVO diaristaVO = new DiaristaVO();
			
			diaristaVO.setCodigo(diarista.getCodigo());
			diaristaVO.setCidade(diarista.getCidade());
			diaristaVO.setCpf(diarista.getCpf());
			diaristaVO.setNome(diarista.getNome());
			diaristaVO.setUsuario(diarista.getUsuario());
			diaristaVO.setTelefone(diarista.getTelefone());
			diaristaVO.setFotoUsuario(diarista.getFotoUsuario());
			diaristaVO.setEspecialidades(diarista.getEspecialidades());
			diaristaVO.setEndereco(diarista.getEndereco());
		
			return diaristaVO;
		}else{
			throw new NegocioException("Você não tem acesso a essa funcionalidade");
		}		

	}	

	@RequestMapping(method = RequestMethod.DELETE, produces = "application/json")
	@ResponseBody
	public void delete(@ModelAttribute("pessoa") Diarista id)
			throws NegocioException {

		diaristaService.removeDiarista(id);

	}
	
	@RequestMapping(value = "/listaHistoricoDiarista", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<HistoricoServico> listaHistorico() throws NegocioException{
		
		Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);		

		Diarista diarista = diaristaService.findByUsuario(usuarioLogado);
		
		List<HistoricoServico> listaHistorico = historicoServicoService.listaHistoricoServicoPorDiaristaEStatus(diarista);
		
		return listaHistorico;
	}
	
	@RequestMapping(value = "/listaAllHistoricoDiarista", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<HistoricoServico> listaHistoricoAllDiarista() throws NegocioException{
		
		Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);		

		Diarista diarista = diaristaService.findByUsuario(usuarioLogado);
		
		List<HistoricoServico> listaHistorico = historicoServicoService.listaHistoricoServicoPorDiarista(diarista);
		
		return listaHistorico;
	}

	@RequestMapping(value = "listarDiaristas", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Diarista> getAll() throws NegocioException{

		return diaristaService.listToDiarista();

	}

	@RequestMapping(value = "getEspecialidades", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<Especialidade> todasEspecialidades() {

		List<Especialidade> listaDeEspecialidades = especialidadeService
				.todasEspecialidadesList();

		return listaDeEspecialidades;

	}

	public Diarista findByCpf(String cpf) throws NegocioException {
		return diaristaService.findByCpf(cpf);
	}
		
	@RequestMapping(value = "/confirmacao", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void confirmacaoDeServico(@RequestBody AceitarServicoVO aceitarServicoVO) throws NegocioException{
		
		Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(
						AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);		

		Diarista diarista = diaristaService.findByUsuario(usuarioLogado);

		try {
			for (int i = 0; i < aceitarServicoVO.getServicosVO().size(); i++) {
				aceitarServicoVO.getServicosVO().get(i).setStatus(StatusServico.ACEITO);
				aceitarServicoVO.getServicosVO().get(i).getNotificacao().setStatus(StatusNotificacao.CONCLUIDA);
				aceitarServicoVO.getServicosVO().get(i).getNotificacao().setDescricaoNotificacao(diarista.getNome() + " " + TipoNotificacao.CONFIRMACAO_DE_SOLICITACAO.getTipoNotificacao());
			}
			this.servicoService.edit(aceitarServicoVO.getServicosVO());
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	@RequestMapping(value = "listaDiaristaPorCidade", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Diarista> listaDiaristaPorCidade(/*Cidade c*/){
		Cidade c = new Cidade();
		c.setCodigoCidade(2);
		ArrayList<Diarista> listaD = new ArrayList<Diarista>();
		try {
			listaD = (ArrayList<Diarista>) diaristaService.listaDeDiaristaPorCidade(c);
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
		return listaD;
	}
	
	@RequestMapping(value = "/ranqueamentoDiarista", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Diarista> ranqueamentoDiarista()throws NegocioException{
		ArrayList<Diarista> listaRDiarista = new ArrayList<Diarista>();
		try {
			listaRDiarista = (ArrayList<Diarista>) diaristaService.listaDiaristaPorRanqueamento();
		} catch (NegocioException e) {
			throw new NegocioException(e.getMessage());
		}
		return listaRDiarista;
	}
}
