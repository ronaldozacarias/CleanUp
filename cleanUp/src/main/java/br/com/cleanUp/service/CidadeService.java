package br.com.cleanUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.repository.CidadeRepository;

@Service
@Transactional
public class CidadeService {
	
	@Autowired
	private CidadeRepository cidadeRepository;
	
	public List<Cidade> todasCidadesList(){
		return (List<Cidade>) cidadeRepository.findAll();
	}

}
