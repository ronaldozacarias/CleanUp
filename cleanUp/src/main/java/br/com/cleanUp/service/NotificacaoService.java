package br.com.cleanUp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Notificacao;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.repository.CidadeRepository;
import br.com.cleanUp.repository.NotificacaoRepository;
import br.com.cleanUp.util.AtributoDeSessao;

@Service
@Transactional
public class NotificacaoService {
	
	@Autowired
	private ServicoService servicoService;
	
	@Autowired
	private NotificacaoRepository notificacaoRepository;
	
	@Autowired
	private DiaristaService diaristaService;
	
	public List<Notificacao> todasNotificacoesDiaristaList(int idDiarista) throws NegocioException{
		
		List<Notificacao> notificacoesDiarista = notificacaoRepository.findByTopTenNotifications(idDiarista);
		return notificacoesDiarista;
		
	}

}
