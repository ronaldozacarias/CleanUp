package br.com.cleanUp.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Especialidade;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.Usuario;
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
		//diaristaRepository.delete(diaristaRepository.findOne(d.getCodigo()));
		// diaristaRepository.save(d);
			try {
				diaristaRepository.save(d);
			} catch (Exception e) {
				throw new NegocioException("Erro Ao tentar edita a diarista");
			}
	}

	public void removeDiarista(Diarista d) throws NegocioException {
		diaristaRepository.delete(d);
		try {

		} catch (Exception e) {
			throw new NegocioException("Erro ao tentar Deletar Diarista");
		}
	}

	/*public List<Diarista> listToDiarista() throws NegocioException{
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
	}*/

	public Diarista findByCpf(String cpf) throws NegocioException {
		try {
			return diaristaRepository.findByCpf(cpf);
		} catch (Exception e) {
			throw new NegocioException("Erro ao tentar buscar diarista.");
		}
	}
	
	public Diarista findByUsuario(Usuario usuario) throws NegocioException {
		Diarista diarista = new Diarista();
		Diarista retorno = new Diarista();
		try {
			retorno = diaristaRepository.findByUsuario(usuario);
			Hibernate.initialize(retorno.getAgenda().getDatasAgenda());
			diarista.setAgenda(retorno.getAgenda());
			diarista.setCidade(retorno.getCidade());
			diarista.setCodigo(retorno.getCodigo());
			diarista.setCpf(retorno.getCpf());
			diarista.setEndereco(retorno.getEndereco());
			diarista.setEspecialidades(retorno.getEspecialidades());
			diarista.setNome(retorno.getNome());
			diarista.setTelefone(retorno.getTelefone());
			diarista.setUsuario(retorno.getUsuario());
			diarista.setValor(retorno.getValor());
			
		} catch (Exception e) {
			throw new NegocioException("Erro ao tentar buscar diarista.");
		}
		if(diarista.getAgenda().getDatasAgenda() == null){
			return retorno;
		}else{
			return diarista;
		}
	}
	
	public List<Diarista> listaDeDiaristaPorEspecialidade(Especialidade e) throws NegocioException{
		ArrayList<Diarista> listaDeDiarista = new ArrayList<Diarista>();
		ArrayList<Diarista> listaDeDiaristaPorEspecialidade = new ArrayList<Diarista>();
		Diarista d = new Diarista();
		try {
			listaDeDiarista = (ArrayList<Diarista>) this.listToDiarista();
			for (int i = 0; i < listaDeDiarista.size(); i++) {
				for (int j = 0; j < listaDeDiarista.get(i).getEspecialidades().size(); j++) {
					if (listaDeDiarista.get(i).getEspecialidades().get(j).getCodigoEspecialidade() == e.getCodigoEspecialidade()) {
						d = listaDeDiarista.get(i);
						listaDeDiaristaPorEspecialidade.add(d);
						System.out.println(d.getNome());
						d = new Diarista();
					}
				}
			}
		} catch (Exception e2) {
			throw new NegocioException("Erro ao buscar a Diarista por Especialidade");
		}
		return listaDeDiaristaPorEspecialidade;
	}
	
	public List<Diarista> listaDeDiaristaPorCidade(Cidade c) throws NegocioException{
		ArrayList<Diarista> listaD = new ArrayList<Diarista>();
		try {
			listaD = (ArrayList<Diarista>) diaristaRepository.findByCidade(c.getCodigoCidade());
		} catch (Exception e) {
			throw new NegocioException("Erro ao buscar Diarista Por Cidade");
		}
		return listaD;
	}
	
	public List<Diarista> listToDiarista() throws NegocioException{
		// return (List<Diarista>) diaristaRepository.findAll();
		List<Diarista> retorno = new ArrayList<Diarista>();
		ArrayList<Diarista> retorno2 = new ArrayList<Diarista>();
		Diarista d;
		try {
			retorno = (List<Diarista>) diaristaRepository.findAll();
			for (int i = 0; i < retorno.size(); i++) {
				d = new Diarista();
				Hibernate.initialize(retorno.get(i).getAgenda().getDatasAgenda());
				d.setAgenda(retorno.get(i).getAgenda());
				d.setCidade(retorno.get(i).getCidade());
				d.setCodigo(retorno.get(i).getCodigo());
				d.setCpf(retorno.get(i).getCpf());
				d.setEndereco(retorno.get(i).getEndereco());
				d.setEspecialidades(retorno.get(i).getEspecialidades());
				d.setNome(retorno.get(i).getNome());
				d.setTelefone(retorno.get(i).getTelefone());
				d.setUsuario(retorno.get(i).getUsuario());
				d.setValor(retorno.get(i).getValor());
				retorno2.add(d);
			}
			if (retorno != null) {
				System.out.println("Lista Retornado");
				for (int i = 0; i < retorno2.size(); i++) {
					System.out.println(retorno2.get(i).getNome());
				}
			}
		} catch (Exception e) {
			throw new NegocioException("Erro ao Listar os Diarista");
		}
		return retorno2;
	}
	
	public List<Diarista> listaDiaristaPorRanqueamento()throws NegocioException{
		List<Diarista> listaDiarista = new ArrayList<Diarista>();
		List<Diarista> listaRetorno = new ArrayList<Diarista>();
		Diarista d;
		try {
			listaDiarista = diaristaRepository.findByRanqueamento();
			for (int i = 0; i < listaDiarista.size(); i++) {
				Hibernate.initialize(listaDiarista.get(i).getAgenda().getDatasAgenda());
				d = new Diarista();
				d.setAgenda(listaDiarista.get(i).getAgenda());
				d.setCidade(listaDiarista.get(i).getCidade());
				d.setCodigo(listaDiarista.get(i).getCodigo());
				d.setCpf(listaDiarista.get(i).getCpf());
				d.setEndereco(listaDiarista.get(i).getEndereco());
				d.setEspecialidades(listaDiarista.get(i).getEspecialidades());
				d.setMediaDiarista(listaDiarista.get(i).getMediaDiarista());
				d.setNome(listaDiarista.get(i).getNome());
				d.setTelefone(listaDiarista.get(i).getTelefone());
				d.setUsuario(listaDiarista.get(i).getUsuario());
				d.setValor(listaDiarista.get(i).getValor());
				listaRetorno.add(d);
			}
		} catch (Exception e) {
			throw new NegocioException("Erro ao Ranquiar Diarista!!");
		}
			return listaRetorno;
	}
}
