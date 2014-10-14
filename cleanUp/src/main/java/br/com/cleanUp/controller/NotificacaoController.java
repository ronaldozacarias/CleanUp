package br.com.cleanUp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Notificacao;
import br.com.cleanUp.service.NotificacaoService;

@Controller
@RequestMapping(value = "/protected/notificacoes")
public class NotificacaoController {
	
	@Autowired
	private NotificacaoService notificacoesService;
	
	@RequestMapping(value = "/getNotificacoes", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Notificacao> notificacoes() throws NegocioException {

		List<Notificacao> listaDeNotificacoes = notificacoesService.todasNotificacoesDiaristaList();

		return listaDeNotificacoes;

	}

}
