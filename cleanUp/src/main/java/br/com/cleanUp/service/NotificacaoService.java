package br.com.cleanUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Notificacao;
import br.com.cleanUp.repository.NotificacaoRepository;

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
		
//		Pageable topTen = new PageRequest(0, 10);
		List<Notificacao> notificacoesDiarista = notificacaoRepository.findByTopTenNotifications(idDiarista/*, topTen*/);
		return notificacoesDiarista;
		
	}
	
	public List<Notificacao> todasNotificacoesClientList(int idCliente) throws NegocioException{
		
//		Pageable topTen = new PageRequest(0, 10);
		List<Notificacao> notificacoesCliente = notificacaoRepository.findNotificacoesCliente(idCliente/*, topTen*/);
		return notificacoesCliente;
		
	}

}
