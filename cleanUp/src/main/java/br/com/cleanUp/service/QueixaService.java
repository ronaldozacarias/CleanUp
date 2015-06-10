package br.com.cleanUp.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Queixa;
import br.com.cleanUp.repository.QueixaRepository;

@Service
@Transactional
public class QueixaService {

	@Autowired
	private QueixaRepository queixaReporitory;
	
	public void saved(Queixa q)throws NegocioException{
	
		try {
			queixaReporitory.save(q);
		} catch (Exception e) {
			throw new NegocioException(e.getMessage() + " " +q.getDiarista().getCodigo());
		}
	}
	
	public void edit(Queixa q)throws NegocioException{
		
		try {
			queixaReporitory.save(q);
		} catch (Exception e) {
			throw new NegocioException("Erro ao Editar Queixa");
		}
	}
	
	public void remove(Queixa q)throws NegocioException{
		
		try {
			queixaReporitory.delete(q.getCodigo());
		} catch (Exception e) {
			throw new NegocioException("Erro ao Excluir Queixa");
		}
	}
	
	public Queixa findById(Integer id)throws NegocioException{
		
		try {
			return queixaReporitory.findOne(id);
		} catch (Exception e) {
			throw new NegocioException("Erro ao buscar queixa por Id");
		}
	}
	
	public List<Queixa> listaDeQueixas()throws NegocioException{
		List<Queixa> listaQueixa = new ArrayList<Queixa>();
		List<Queixa> retornoQueixa = new ArrayList<Queixa>();
		Queixa q;
		try {
			listaQueixa = (List<Queixa>) queixaReporitory.findAll();
			for (int i = 0; i < listaQueixa.size(); i++) {
				q = new Queixa();
				Hibernate.initialize(listaQueixa.get(i).getMensagem());
				q.setMensagem(listaQueixa.get(i).getMensagem());
				q.setCliente(listaQueixa.get(i).getCliente());
				q.setCodigo(listaQueixa.get(i).getCodigo());
				q.setDiarista(listaQueixa.get(i).getDiarista());
				retornoQueixa.add(q);
			}
		} catch (Exception e) {
			throw new NegocioException("Erro ao lista queixas");
		}
		return retornoQueixa;
	}
	
	public List<Queixa> listaDeQueixasPorDiarista(Diarista d)throws NegocioException{
		List<Queixa> listaQueixa = new ArrayList<Queixa>();
		List<Queixa> retornoQueixa = new ArrayList<Queixa>();
		Queixa q;
		try {
			listaQueixa = queixaReporitory.listaDeQueixasPorDiarista(d.getCodigo());
			for (int i = 0; i < listaQueixa.size(); i++) {
				q = new Queixa();
				Hibernate.initialize(listaQueixa.get(i).getMensagem());
				q.setMensagem(listaQueixa.get(i).getMensagem());
				q.setCliente(listaQueixa.get(i).getCliente());
				q.setCodigo(listaQueixa.get(i).getCodigo());
				q.setDiarista(listaQueixa.get(i).getDiarista());
				retornoQueixa.add(q);
			}
		} catch (Exception e) {
			throw new NegocioException("Erro ao lista queixa por diarista");
		}
		return retornoQueixa;
	}
	
	public List<Queixa> listaDeQueixasPorCliente(Cliente c)throws NegocioException{
		List<Queixa> listaQueixa = new ArrayList<Queixa>();
		List<Queixa> retornoQueixa = new ArrayList<Queixa>();
		Queixa q;
		try {
			 listaQueixa = queixaReporitory.listaDeQueixasPorDiarista(c.getCodigo());
			 for (int i = 0; i < listaQueixa.size(); i++) {
				q = new Queixa();
				Hibernate.initialize(listaQueixa.get(i).getMensagem());
				q.setMensagem(listaQueixa.get(i).getMensagem());
				q.setCliente(listaQueixa.get(i).getCliente());
				q.setCodigo(listaQueixa.get(i).getCodigo());
				q.setDiarista(listaQueixa.get(i).getDiarista());
				retornoQueixa.add(q);
			}
		} catch (Exception e) {
			throw new NegocioException("Erro ao lista queixa por cliente");
		}
		return retornoQueixa;
	}
	
	public Queixa findById(Queixa q)throws NegocioException{
		Queixa queixa = new Queixa();
		Queixa retornoQ;
		try {
			retornoQ = new Queixa();
			queixa = queixaReporitory.findOne(q.getCodigo());
			Hibernate.initialize(queixa.getMensagem());
			retornoQ.setMensagem(queixa.getMensagem());
			retornoQ.setCliente(queixa.getCliente());
			retornoQ.setCodigo(queixa.getCodigo());
			retornoQ.setDiarista(queixa.getDiarista());
		} catch (Exception e) {
			throw new NegocioException("Erro ao buscar Queixa");
		}
		return retornoQ;
	}
}
