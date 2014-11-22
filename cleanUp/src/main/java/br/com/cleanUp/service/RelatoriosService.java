package br.com.cleanUp.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.RelatorioDiarista;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.repository.RelatorioDiaristaRepository;

@Service
@Transactional
public class RelatoriosService {

	@Autowired
	public RelatorioDiaristaRepository relatorioConCan;
	
	@Autowired
	public HistoricoServicoService historicoServico;
	
	@Autowired
	public ServicoService servicoService;
	
	public void saved(RelatorioDiarista relatorio)throws NegocioException{
		try {
			relatorioConCan.save(relatorio);
		} catch (Exception e) {
			throw new NegocioException();
		}
	}
	
	public RelatorioDiarista relatorioDiarista(Diarista d)throws NegocioException{
		RelatorioDiarista relatorio = new RelatorioDiarista();
		List<Servico> lista = new ArrayList<Servico>();
		int bom = 0;
		int regular = 0;
		int ruim = 0;
		try {
			lista = servicoService.listServiceToDiarista(d.getCodigo());
			for (int i = 0; i < lista.size(); i++) {
				String status = new String();
				status = lista.get(i).getStatus().toString();
				if(status.equals("CONCLUIDO")){
					if(lista.get(i).getAvaliacao() >= 1 && lista.get(i).getAvaliacao() < 3){
						ruim++;
					}else if(lista.get(i).getAvaliacao() == 3){
						regular++;
					}else if(lista.get(i).getAvaliacao() > 3 && lista.get(i).getAvaliacao() <= 5){
						bom++;
					}
				}
			}
			relatorio.setNumeroBons(bom);
			relatorio.setNumeroRegulares(regular);
			relatorio.setNumeroRuins(ruim);
			relatorio.setDiarista(d);
			relatorio.setDataGeracao(new Date());
		} catch (Exception e) {
			throw new NegocioException("Erro ao Gerar Relatorio.");
		}
		this.saved(relatorio);
		return relatorio;
	} 
}