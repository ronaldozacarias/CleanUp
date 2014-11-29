package br.com.cleanUp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import br.com.cleanUp.model.Especialidade;
import br.com.cleanUp.repository.EspecialidadeRepository;

@Service
@Transactional
public class EspecialidadeService {
	
	@Autowired
	private EspecialidadeRepository especialidadeRepository;

	public List<Especialidade> todasEspecialidadesList(){
		return (List<Especialidade>) especialidadeRepository.findAll();
	}
	
	public Especialidade getEspecialidade(Integer codigoEspecialidade){
		return especialidadeRepository.findOne(codigoEspecialidade);
	}
	
}
