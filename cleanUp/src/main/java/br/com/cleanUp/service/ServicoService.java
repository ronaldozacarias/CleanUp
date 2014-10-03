package br.com.cleanUp.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.controller.DiaristaController;
import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.repository.ServicoRepository;

@Service
@Transactional
public class ServicoService {
	
	@Autowired
	private ServicoRepository servicoRepository;

	public void save(ArrayList<Servico> s) throws NegocioException{
		DiaristaController dc = new DiaristaController();
		try {
			for (int i = 0; i < s.size(); i++) {
				servicoRepository.save(s.get(i));
			}
			dc.solicitacaoDeServico(s);
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
}
