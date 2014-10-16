package br.com.cleanUp.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import br.com.cleanUp.model.Notificacao;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.StatusNotificacao;
import br.com.cleanUp.model.StatusServico;
import br.com.cleanUp.model.TipoNotificacao;
import br.com.cleanUp.model.TipoServico;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.ClienteService;
import br.com.cleanUp.service.ServicoService;
import br.com.cleanUp.util.AtributoDeSessao;
import br.com.cleanUp.vo.PessoaVO;
import br.com.cleanUp.vo.ServicoVO;

@Controller
@RequestMapping("/protected/servico/")
public class ServicoController {
	
	@Autowired
	private ServicoService servicoService;
	
	@Autowired
	private ClienteService clienteService;
	
	
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
	
	@RequestMapping(value="cancelar", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public void cancelarServico(Servico s){
		Servico s1 = new Servico();
		s1.setDataServico(new Date());
		s1.setCodServico(4);
		try {
			servicoService.cancelarServico(s1);
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
	}
}