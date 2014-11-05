package br.com.cleanUp.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
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
		List<Notificacao> retornoNotificacao = new ArrayList<Notificacao>();
		Notificacao notificacao;
			try {
				for (int i = 0; i < notificacoesDiarista.size(); i++) {
					notificacao = new Notificacao();
					Hibernate.initialize(notificacoesDiarista.get(i).getDiarista().getAgenda().getDatasAgenda());
					notificacao.setDiarista(notificacoesDiarista.get(i).getDiarista());
					notificacao.setCliente(notificacoesDiarista.get(i).getCliente());
					notificacao.setDataEnvioNotificacao(notificacoesDiarista.get(i).getDataEnvioNotificacao());
					notificacao.setDescricaoNotificacao(notificacoesDiarista.get(i).getDescricaoNotificacao());
					notificacao.setIdNotificacao(notificacoesDiarista.get(i).getIdNotificacao());
					notificacao.setStatus(notificacoesDiarista.get(i).getStatus());
					retornoNotificacao.add(notificacao);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		return retornoNotificacao;
		
	}
	
	public List<Notificacao> todasNotificacoesClientList(int idCliente) throws NegocioException{
		
//		Pageable topTen = new PageRequest(0, 10);
		List<Notificacao> notificacoesCliente = notificacaoRepository.findNotificacoesCliente(idCliente/*, topTen*/);
		List<Notificacao> retornoNotificacao = new ArrayList<Notificacao>();
		Notificacao n;
		try {
			for (int i = 0; i < notificacoesCliente.size(); i++) {
				n = new Notificacao();
				Hibernate.initialize(notificacoesCliente.get(i).getDiarista().getAgenda().getDatasAgenda());
				n.setDiarista(notificacoesCliente.get(i).getDiarista());
				n.setDataEnvioNotificacao(notificacoesCliente.get(i).getDataEnvioNotificacao());
				n.setDescricaoNotificacao(notificacoesCliente.get(i).getDescricaoNotificacao());
				n.setIdNotificacao(notificacoesCliente.get(i).getIdNotificacao());
				n.setStatus(notificacoesCliente.get(i).getStatus());
				retornoNotificacao.add(n);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return retornoNotificacao;
		
	}

}
