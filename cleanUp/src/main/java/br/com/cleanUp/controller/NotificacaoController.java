package br.com.cleanUp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Notificacao;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.ClienteService;
import br.com.cleanUp.service.DiaristaService;
import br.com.cleanUp.service.NotificacaoService;
import br.com.cleanUp.util.AtributoDeSessao;

@Controller
@RequestMapping(value = "/protected/notificacao")
public class NotificacaoController {
	
	@Autowired
	private NotificacaoService notificacoesService;
	
	@Autowired
	private DiaristaService diaristaService;
	
	@Autowired
	private ClienteService clienteService;
	
	@RequestMapping(value = "/getNotificacoes", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Notificacao> notificacoes() throws NegocioException {
		
		Usuario usuario = (Usuario) RequestContextHolder.currentRequestAttributes()
				.getAttribute(AtributoDeSessao.LOGGED_USER, RequestAttributes.SCOPE_SESSION);

		Diarista diarista = diaristaService.findByUsuario(usuario);

		List<Notificacao> listaDeNotificacoes = notificacoesService.todasNotificacoesDiaristaList(diarista.getCodigo());

		return listaDeNotificacoes;

	}
	
	@RequestMapping(value = "/getNotificacoesPorCliente", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Notificacao> notificacoesPorCliente() throws NegocioException {
		
		Usuario usuario = (Usuario) RequestContextHolder.currentRequestAttributes()
				.getAttribute(AtributoDeSessao.LOGGED_USER, RequestAttributes.SCOPE_SESSION);

		Cliente cliente = clienteService.findByIdUsuario(usuario.getId());

		List<Notificacao> listaDeNotificacoes = notificacoesService.todasNotificacoesClientList(cliente.getCodigo());

		return listaDeNotificacoes;

	}

}
