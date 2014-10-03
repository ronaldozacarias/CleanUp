package br.com.cleanUp.service;

import java.util.ArrayList;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.controller.DiaristaController;
import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.StatusServico;
import br.com.cleanUp.repository.EnderecoRepository;
import br.com.cleanUp.repository.ServicoRepository;

@Service
@Transactional
public class ServicoService {
	
	@Autowired
	private ServicoRepository servicoRepository;
	
	@Autowired
	private EnderecoRepository enderecoRepository;

	public void save(Servico s, ArrayList<Endereco> listaE) throws NegocioException{
		DiaristaController dc = new DiaristaController();
		ArrayList<Servico> listaServ = new ArrayList<Servico>();
		try {
			for (int i = 0; i < listaE.size(); i++) {
				Servico serv = new Servico();
				serv.setCliente(s.getCliente());
				serv.setDataServico(s.getDataServico());
				serv.setDescricao(s.getDescricao());
				serv.setDiarista(s.getDiarista());
				serv.setServicoTipoNotificacoes(s.getServicoTipoNotificacoes());
				serv.setStatus(s.getStatus());
				serv.setTipoServico(s.getTipoServico());
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
		GregorianCalendar calendar = new GregorianCalendar();
		int diaDoCancelamento = calendar.get(GregorianCalendar.DAY_OF_MONTH);
		GregorianCalendar calendar2 = new GregorianCalendar();
		calendar2.setTime(s.getDataServico());
		int diaDoServico = calendar2.get(GregorianCalendar.DAY_OF_MONTH);
		try {
			if ((diaDoServico - diaDoCancelamento) <= 2) {
				throw new NegocioException("Cancelamento não pode ser Realizado");
			}else{
				s.setStatus(StatusServico.INATIVO);
				servicoRepository.delete(s);
				servicoRepository.save(s);
			}
		} catch (Exception e) {
			throw new NegocioException("Erro ao Cancelar Servico");
		}
	}
}
