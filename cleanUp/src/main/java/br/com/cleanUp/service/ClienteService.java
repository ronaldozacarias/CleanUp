package br.com.cleanUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.model.Pessoa;
import br.com.cleanUp.repository.PessoaRepository;

@Service
@Transactional
public class ClienteService {
	
	@Autowired
    private PessoaRepository pessoaRepository;

	public void save(Pessoa p){
		pessoaRepository.save(p);
	}
	
}
