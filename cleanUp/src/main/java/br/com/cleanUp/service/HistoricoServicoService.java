package br.com.cleanUp.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.HistoricoServico;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.repository.HistoricoServicoRepository;

@Service
@Transactional
public class HistoricoServicoService {

	@Autowired
	private HistoricoServicoRepository historicoServico;
	
	public void salvarHistorioDeServico(Servico servico)throws NegocioException{
		HistoricoServico hs = new HistoricoServico();
		try {
			hs.setCodServico(servico.getCodServico());
			hs.setCliente(servico.getCliente());
			hs.setDataServico(servico.getDataServico());
			hs.setDescricao(servico.getDescricao());
			hs.setDiarista(servico.getDiarista());
			hs.setEndereco(servico.getEndereco());
			hs.setStatus(servico.getStatus());
			hs.setTipoServico(servico.getTipoServico());
			hs.setValor(servico.getValor());
			hs.setDataAlteracao(new Date());
			historicoServico.save(hs);
		} catch (Exception e) {
			throw new NegocioException("Erro ao Salvar Historico");
		}
	}
	
	public List<HistoricoServico> listaHistoricoServico()throws NegocioException{
		try {
			return (List<HistoricoServico>) historicoServico.findAll();
		} catch (Exception e) {
			throw new NegocioException("Erro ao Lista Historico de Serviço");
		}
	}
	
	public List<HistoricoServico> listaHistoricoServicoPorDiarista(Diarista diarista)throws NegocioException{
		try {
			return (List<HistoricoServico>) historicoServico.listarHistoricoServicoPorDiarista(diarista.getCodigo());
		} catch (Exception e) {
			throw new NegocioException("Erro ao Lista Historico de Serviço Por Diarista");
		}
	}
	
	public List<HistoricoServico> listaHistoricoServicoPorCliente(Cliente cliente)throws NegocioException{
		try {
			return (List<HistoricoServico>) historicoServico.listarHistoricoServicoPorCliente(cliente.getCodigo());
		} catch (Exception e) {
			throw new NegocioException("Erro ao Lista Historico de Serviço Por Cliente");
		}
	}
}
