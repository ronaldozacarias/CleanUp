package br.com.cleanUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.repository.DiaristaRepository;

@Service
@Transactional
public class DiaristaService {

	@Autowired
	private DiaristaRepository diaristaRepository;

	public void saveDiarista(Diarista d) throws NegocioException {
		// diaristaRepository.save(d);
		try {
			diaristaRepository.save(d);
		} catch (Exception e) {
			throw new NegocioException("Erro ao tenta salvar Diarista");
		}
	}

	public void editDiarista(Diarista d) throws NegocioException {
		diaristaRepository.delete(diaristaRepository.findOne(d.getCodigo()));
		// diaristaRepository.save(d);
		try {

		} catch (Exception e) {
			try {
				diaristaRepository.save(d);
			} catch (Exception e2) {
				throw new NegocioException("Erro Ao tentar edita a diarista");
			}
		}
	}

	public void removeDiarista(Diarista d) throws NegocioException {
		diaristaRepository.delete(d);
		try {

		} catch (Exception e) {
			throw new NegocioException("Erro ao tentar Deletar Diarista");
		}
	}

	public List<Diarista> listToDiarista() throws NegocioException {
		// return (List<Diarista>) diaristaRepository.findAll();
		List<Diarista> retorno;
		retorno = (List<Diarista>) diaristaRepository.findAll();
		try {
			if (retorno != null) {
				System.out.println("Lista Retornado");
			}
		} catch (Exception e) {
			throw new NegocioException("Erro ao Listar os Diarista");
		}
		return retorno;
	}

	public Diarista findByCpf(String cpf) throws NegocioException {
		try {
			return diaristaRepository.findByCpf(cpf);
		} catch (Exception e) {
			throw new NegocioException("Erro ao tentar buscar diarista.");
		}
	}
}
