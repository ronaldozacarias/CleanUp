package br.com.cleanUp.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Notificacao;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.StatusNotificacao;
import br.com.cleanUp.model.StatusServico;
import br.com.cleanUp.repository.DiaristaRepository;
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
	
	@Autowired
	private DiaristaRepository diaristaRepository;
	
	@Autowired
	private HistoricoServicoService historioServicoService;
	
	@Autowired
	private NotificacaoService notificacaoService;

	public void save(Servico s, List<Endereco> listaE, Notificacao noti) throws NegocioException{
		try {
			for (int i = 0; i < listaE.size(); i++) {
				Servico serv = new Servico();
				Notificacao notificacao = new Notificacao();
				notificacao.setCliente(noti.getCliente());
				notificacao.setDiarista(noti.getDiarista());
				notificacao.setDataEnvioNotificacao(new Date());
				notificacao.setDescricaoNotificacao(s.getNotificacao().getDescricaoNotificacao());
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
				historioServicoService.salvarHistorioDeServico(serv);
			}
		} catch (Exception e) {
			throw new NegocioException("Erro ao Salvar Servico");
		}
	}
	
	public void edit(ArrayList<Servico> s)throws NegocioException{
		try {
			for (int i = 0; i < s.size(); i++) {
				servicoRepository.delete(s.get(i).getCodServico());
				servicoRepository.save(s.get(i));
				historioServicoService.salvarHistorioDeServico(s.get(i));
			}
		} catch (Exception e) {
			throw new NegocioException("Erro ao Salvar Servico");
		}
	}
	
	public void singleEdit(Servico servico) throws NegocioException{
		try {
			historioServicoService.salvarHistorioDeServico(servico);
			servicoRepository.save(servico);			
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
		
//		HistorioServico hs = new HistorioServico();
			if ((millisServico - millisCancelamento) <= 172800000 && serv.getStatus().equals(StatusServico.ACEITO)) {
				serv.setStatus(StatusServico.ACEITO);
				throw new NegocioException("O cancelamento não pode ser Realizado: Só é permitido a exclusão com dois dias de antecedência");
			}else{			
				serv.setStatus(StatusServico.CANCELAR);
				this.historioServicoService.salvarHistorioDeServico(serv);				
				this.singleEdit(serv);
			}
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

	public List<Servico> findByServicosPorCliente(int codigoCliente, int codigoDiarista )throws NegocioException {
		
		List<Servico> servicosPorCliente = servicoRepository.listarServicoPorClienteEDiarista(codigoCliente, codigoDiarista);
		
		return servicosPorCliente;
	}
	
	public List<Servico> findByServicosPorClienteCli(Integer codigo) {
		
		List<Servico> servicosPorCliente = servicoRepository.listarServicoPorCliente(codigo);
		
		return servicosPorCliente;
		
	}

	public List<Servico> listServicosDiarista(Integer codigoDiarista) {
		
		List<Servico> servicosPorDiarista = servicoRepository.listarServicoPorDiarista(codigoDiarista);
		
		return servicosPorDiarista;
	}
	
	public void avaliarServico(Servico servico)throws NegocioException{
		
		singleEdit(servico);
		
		List<Servico> servicos = listServicosDiarista(servico.getDiarista().getCodigo());
		
		calcularMediaDiarista(servicos);
	}
	
	public void calcularMediaDiarista(List<Servico> servicos) throws NegocioException{
		
		float media = 0.0f;
		float somaM = 0.0f;
		int cont = 0;
		
		for(Servico servico : servicos){
			
			if(servico.getDiarista().getMediaDiarista() <= 0){
				media = servico.getAvaliacao();				
			}else{
				for (int i = 0; i < servicos.size(); i++) {
					if(servicos.get(i).getStatus() == StatusServico.CONCLUIDO && servicos.get(i).getAvaliacao() > 0){
						somaM = somaM + servicos.get(i).getAvaliacao();
						cont++;
					}
				}
				
				media = somaM/cont;				
			}
			
			servico.getDiarista().setMediaDiarista(media);
			diaristaRepository.save(servico.getDiarista());
			
		}
			
	}
	
}
