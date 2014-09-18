package br.com.cleanUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.repository.DiaristaRepository;

@Service
@Transactional
public class DiaristaService {

	@Autowired
	private DiaristaRepository diaristaRepository;
	
	@Autowired
	private ClienteService clienteService;
	
	public void saveDiarista(Diarista d){
		diaristaRepository.save(d);
	}
	
	public void editDiarista(Diarista d){
		diaristaRepository.delete(diaristaRepository.findOne(d.getCodigo()));
		diaristaRepository.save(d);
	}
	
	public void removeDiarista(Diarista d){
		diaristaRepository.delete(d);
	}
	
	public List<Diarista> listToDiarista(){
		return (List<Diarista>) diaristaRepository.findAll();
	}
	
	public List<Cliente> listToCliente(){
		return clienteService.listCliente();
	}
	
}
