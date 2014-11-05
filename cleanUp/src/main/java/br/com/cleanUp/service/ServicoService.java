package br.com.cleanUp.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.controller.DiaristaController;
import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.HistorioServico;
import br.com.cleanUp.model.Notificacao;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.StatusNotificacao;
import br.com.cleanUp.model.StatusServico;
import br.com.cleanUp.model.TipoNotificacao;
import br.com.cleanUp.repository.EnderecoRepository;
import br.com.cleanUp.repository.HistoricoServicoRepository;
import br.com.cleanUp.repository.ServicoRepository;

@Service
@Transactional
public class ServicoService {
	
	@Autowired
	private ServicoRepository servicoRepository;
	
	@Autowired
	private EnderecoRepository enderecoRepository;
	
	@Autowired
	private HistoricoServicoRepository historicoServico;

	public void save(Servico s, List<Endereco> listaE, Notificacao noti) throws NegocioException{
		DiaristaController dc = new DiaristaController();
		ArrayList<Servico> listaServ = new ArrayList<Servico>();
		try {
			for (int i = 0; i < listaE.size(); i++) {
				Servico serv = new Servico();
				Notificacao notificacao = new Notificacao();
				notificacao.setCliente(noti.getCliente());
				notificacao.setDiarista(noti.getDiarista());
				notificacao.setDataEnvioNotificacao(new Date());
				notificacao.setDescricaoNotificacao(TipoNotificacao.SOLICITACAO_DO_CLIENTE.getTipoNotificacao());
				notificacao.setStatus(StatusNotificacao.PENDENTE);
				
				serv.setCliente(s.getCliente());
				serv.setDataServico(s.getDataServico());
				serv.setDescricao(s.getDescricao());
				serv.setDiarista(s.getDiarista());				
				serv.setStatus(s.getStatus());
				serv.setNotificacao(notificacao);
				serv.setValor(s.getValor());
				enderecoRepository.save(listaE.get(i));
				serv.setEndereco(listaE.get(i));
				servicoRepository.save(serv);
				listaServ.add(serv);
			}
			dc.solicitacaoDeServico(listaServ);
		} catch (Exception e) {
			throw new NegocioException("Erro ao Salvar Servico");
		}
	}
	
	public void edit(ArrayList<Servico> s)throws NegocioException{
		try {
			for (int i = 0; i < s.size(); i++) {
				servicoRepository.delete(s.get(i).getCodServico());
				servicoRepository.save(s.get(i));
			}
		} catch (Exception e) {
			throw new NegocioException("Erro ao Salvar Servico");
		}
	}
	
	public void cancelarServico(Servico s)throws NegocioException{
		Servico serv = new Servico();
		serv = this.findById(s);
		
		Date dataCancelamento = new Date();
		long millisCancelamento = dataCancelamento.getTime();
		Date dataSevico = serv.getDataServico();
		long millisServico = dataSevico.getTime();
		
		HistorioServico hs = new HistorioServico();
//		try {
			if ((millisServico - millisCancelamento) <= 172800000) {
				serv.setStatus(StatusServico.ATIVO);
				throw new NegocioException("Cancelamento não pode ser Realizado");
			}else{
				hs.setCodServico(serv.getCodServico());
				hs.setCliente(serv.getCliente());
				hs.setDataServico(serv.getDataServico());
				hs.setDescricao(serv.getDescricao());
				hs.setDiarista(serv.getDiarista());
				hs.setEndereco(serv.getEndereco());				
				hs.setStatus(StatusServico.INATIVO);
				hs.setTipoServico(serv.getTipoServico());
				hs.setValor(serv.getValor());
				this.historicoServico.save(hs);
				this.removeServico(serv);
			}
//		} catch (Exception e) {
//			throw new NegocioException("Erro ao Cancelar Servico!!");
//		}
	}
	
	public Servico findById(Servico s) throws NegocioException{
		Servico serv = new Servico();
		try {
			serv = servicoRepository.findOne(s.getCodServico());
		} catch (Exception e) {
			throw new NegocioException("Erro ao Buscar Servico");
		}
		return serv;
	}
	
	public void removeServico(Servico s)throws NegocioException{
		try {
			servicoRepository.delete(s);
		} catch (Exception e) {
			throw new NegocioException("Erro ao Deletar o Servico");
		}
	}
	
	public List<Servico> listServiceToDiarista(Integer codDiarista) throws NegocioException{
		try {
			return servicoRepository.listarServicosPorDiarista(codDiarista);
		} catch (Exception e) {
			throw new NegocioException("Erro ao Listar os Servico");
		}
	}
	
	public ArrayList<Servico> listaTodosServico() throws NegocioException {
		ArrayList<Servico> listaServico = new ArrayList<Servico>();
		try {
			listaServico = (ArrayList<Servico>) servicoRepository.findAll();
		} catch (Exception e) {
			throw new NegocioException("Erro ao tentar lista todos o Sevisso");
		}
		return listaServico;
	}

	public List<Servico> findByServicosPorCliente(int codigoCliente, Integer codigoDiarista)throws NegocioException {
		
		List<Servico> servicosPorCliente = servicoRepository.listarServicoPorClienteEDiarista(codigoCliente, codigoDiarista);
		List<Servico> retornoServico = new ArrayList<Servico>();
		Servico s;
		try {
			for (int i = 0; i < servicosPorCliente.size(); i++) {
				s = new Servico();
				Hibernate.initialize(servicosPorCliente.get(i).getDiarista().getAgenda().getDatasAgenda());
				s.setDiarista(servicosPorCliente.get(i).getDiarista());
				s.setCliente(servicosPorCliente.get(i).getCliente());
				s.setCodServico(servicosPorCliente.get(i).getCodServico());
				s.setDataServico(servicosPorCliente.get(i).getDataServico());
				s.setDescricao(servicosPorCliente.get(i).getDescricao());
				s.setEndereco(servicosPorCliente.get(i).getEndereco());
				s.setNotificacao(servicosPorCliente.get(i).getNotificacao());
				s.setStatus(servicosPorCliente.get(i).getStatus());
				s.setTipoServico(servicosPorCliente.get(i).getTipoServico());
				s.setValor(servicosPorCliente.get(i).getValor());
				retornoServico.add(s);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		int cont = 0;
		for (int i = 0; i < retornoServico.size(); i++) {
			if (retornoServico.get(i).getDiarista().getAgenda().getDatasAgenda() != null) {
				cont++;
			}
		}
		if(cont > 0){
			return retornoServico;
		}else{
			return servicosPorCliente;
		}
	}

	public List<Servico> listServicosDiarista(Integer codigoDiarista) {
		
		List<Servico> servicosPorDiarista = servicoRepository.listarServicoPorDiarista(codigoDiarista);
		List<Servico> retornoServico = new ArrayList<Servico>();
		Servico s;
		try {
			for (int i = 0; i < servicosPorDiarista.size(); i++) {
				s = new Servico();
				Hibernate.initialize(servicosPorDiarista.get(i).getDiarista().getAgenda().getDatasAgenda());
				s.setDiarista(servicosPorDiarista.get(i).getDiarista());
				s.setCliente(servicosPorDiarista.get(i).getCliente());
				s.setCodServico(servicosPorDiarista.get(i).getCodServico());
				s.setDataServico(servicosPorDiarista.get(i).getDataServico());
				s.setDescricao(servicosPorDiarista.get(i).getDescricao());
				s.setEndereco(servicosPorDiarista.get(i).getEndereco());
				s.setNotificacao(servicosPorDiarista.get(i).getNotificacao());
				s.setStatus(servicosPorDiarista.get(i).getStatus());
				s.setTipoServico(servicosPorDiarista.get(i).getTipoServico());
				s.setValor(servicosPorDiarista.get(i).getValor());
				retornoServico.add(s);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		int cont = 0;
		for (int i = 0; i < retornoServico.size(); i++) {
			if (retornoServico.get(i).getDiarista().getAgenda().getDatasAgenda() != null) {
				cont++;
			}
		}
		if(cont > 0){
			return retornoServico;
		}else{
			return servicosPorDiarista;
		}
	}
}
