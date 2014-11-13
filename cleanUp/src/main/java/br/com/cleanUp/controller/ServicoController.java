package br.com.cleanUp.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Notificacao;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.StatusNotificacao;
import br.com.cleanUp.model.StatusServico;
import br.com.cleanUp.model.TipoNotificacao;
import br.com.cleanUp.model.TipoServico;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.ClienteService;
import br.com.cleanUp.service.DiaristaService;
import br.com.cleanUp.service.ServicoService;
import br.com.cleanUp.util.AtributoDeSessao;
import br.com.cleanUp.vo.PessoaVO;
import br.com.cleanUp.vo.ServicoVO;

@Controller
@RequestMapping(value = "/protected/servico/")
public class ServicoController {
	
	@Autowired
	private ServicoService servicoService;
	
	@Autowired
	private ClienteService clienteService;
	
	@Autowired
	private DiaristaService diaristaService;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView registrar() {
		return new ModelAndView("servico");
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void saved(@RequestBody ServicoVO servicoVO)throws NegocioException {
		
		Usuario usuario = (Usuario) RequestContextHolder.currentRequestAttributes()
								.getAttribute(AtributoDeSessao.LOGGED_USER, RequestAttributes.SCOPE_SESSION);
		
		Cliente cliente = clienteService.findByIdUsuario(usuario.getId());
		
		List<Endereco> listaE = servicoVO.getEnderecos();

		Servico servico = new Servico();		
		Notificacao notificacao = new Notificacao();
		notificacao.setCliente(cliente);
		notificacao.setDiarista(servicoVO.getDiarista());
		notificacao.setDataEnvioNotificacao(new Date());
		notificacao.setDescricaoNotificacao(TipoNotificacao.SOLICITACAO_DO_CLIENTE.getTipoNotificacao());
		notificacao.setStatus(StatusNotificacao.PENDENTE);
		
		servico.setStatus(StatusServico.PENDENTE);
		servico.setNotificacao(notificacao);
		servico.setCliente(cliente);
		servico.setDiarista(servicoVO.getDiarista());
		servico.setDataServico(servicoVO.getData());
		servico.setDescricao(servicoVO.getDescricao());
		
		try {
			servicoService.save(servico, listaE, notificacao);
		} catch (Exception e2) {
			System.out.println(e2.getMessage());
		}
	}
	
	@RequestMapping(value="cancelar", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void cancelarServico(@RequestBody ServicoVO servicoVO) throws NegocioException{
		
		Servico servico = new Servico();
		
		servico.setCodServico(servicoVO.getCodigo());
		servico.setDataServico(new Date());

		servicoService.cancelarServico(servico);

	}
	
//	@RequestMapping(value="listarServicosPorClienteCli", method = RequestMethod.POST, produces = "application/json")
//	@ResponseBody
//	public List<Servico> servicosPorCliente()throws NegocioException {
//		
//		Usuario usuario = (Usuario) RequestContextHolder.currentRequestAttributes()
//				.getAttribute(AtributoDeSessao.LOGGED_USER, RequestAttributes.SCOPE_SESSION);
//
//		Diarista diarista = diaristaService.findByUsuario(usuario);
//		
//		List<Servico> servicosPorCliente = servicoService.findByServicosPorCliente(pessoa.getCodigo(), diarista.getCodigo());
//
//		System.out.print(pessoa.getCodigo() + "#########################");
//		
//		return servicosPorCliente;
//		
//	}	
	
	
	@RequestMapping(value = "listarServicosPorCliente", method = RequestMethod.POST)
	@ResponseBody
	public List<Servico> servicosPorCliente(@RequestParam("codigoCliente") int codigoCliente) throws NegocioException {
		
		Usuario usuario = (Usuario) RequestContextHolder.currentRequestAttributes()
				.getAttribute(AtributoDeSessao.LOGGED_USER, RequestAttributes.SCOPE_SESSION);

		Diarista diarista = diaristaService.findByUsuario(usuario);
		
		List<Servico> servicosPorCliente = servicoService.findByServicosPorCliente(codigoCliente, diarista.getCodigo());
		
		return servicosPorCliente;
		
	}

	
	@RequestMapping(value = "listarServicosPorClienteCli", method = RequestMethod.POST)
	@ResponseBody
	public List<Servico> servicosPorCliente() throws NegocioException {
		
		Usuario usuario = (Usuario) RequestContextHolder.currentRequestAttributes()
				.getAttribute(AtributoDeSessao.LOGGED_USER, RequestAttributes.SCOPE_SESSION);

		Cliente cliente = clienteService.findByIdUsuario(usuario.getId());
		
		List<Servico> servicosPorCliente = servicoService.findByServicosPorClienteCli(cliente.getCodigo());
		
		return servicosPorCliente;
		
	}
	
	@RequestMapping(value = "listarServicosPorDiarista", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<Servico> servicosPorDiarista() throws NegocioException {
		
		Usuario usuario = (Usuario) RequestContextHolder.currentRequestAttributes()
				.getAttribute(AtributoDeSessao.LOGGED_USER, RequestAttributes.SCOPE_SESSION);

		Diarista diarista = diaristaService.findByUsuario(usuario);
		
		List<Servico> servicosPorCliente = servicoService.listServicosDiarista(diarista.getCodigo());
		
		return servicosPorCliente;
		
	}
}