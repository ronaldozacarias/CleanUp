package br.com.cleanUp.service;

import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import br.com.cleanUp.controller.DiaristaController;
import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.HistorioServico;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.StatusServico;
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

	public void save(Servico s, List<Endereco> listaE) throws NegocioException{
		DiaristaController dc = new DiaristaController();
		ArrayList<Servico> listaServ = new ArrayList<Servico>();
		try {
			for (int i = 0; i < listaE.size(); i++) {
				Servico serv = new Servico();
				serv.setCliente(s.getCliente());
				serv.setDataServico(s.getDataServico());
				serv.setDescricao(s.getDescricao());
				serv.setDiarista(s.getDiarista());				
				serv.setStatus(s.getStatus());
				serv.setNotificacao(s.getNotificacao());
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
		
		GregorianCalendar calendar = new GregorianCalendar();
		int diaDoCancelamento = calendar.get(GregorianCalendar.DAY_OF_MONTH);
		GregorianCalendar calendar2 = new GregorianCalendar();
		calendar2.setTime(serv.getDataServico());
		int diaDoServico = calendar2.get(GregorianCalendar.DAY_OF_MONTH);
		
		HistorioServico hs = new HistorioServico();
		try {
			if ((diaDoServico - diaDoCancelamento) <= 2) {
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
		} catch (Exception e) {
			throw new NegocioException("Erro ao Cancelar Servico!!");
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
}
