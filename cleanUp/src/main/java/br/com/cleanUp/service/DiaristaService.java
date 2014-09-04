package br.com.cleanUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.repository.DiaristaRepository;

@Service
@Transactional
public class DiaristaService {

	@Autowired
	private DiaristaRepository diaristaRepository;
	
	public void saveDiarista(Diarista d){
		diaristaRepository.save(d);
	}
	
	public void editDiarista(Diarista d){
		diaristaRepository.delete(d);
	}
	
	public void removeDiarista(Diarista d){
		diaristaRepository.delete(d);
	}
	
	public List<Diarista> listToDiarista(){
		return (List<Diarista>) diaristaRepository.findAll();
	}
}
