package br.com.cleanUp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Especialidade;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.repository.DiaristaRepository;

@Service
@Transactional
public class DiaristaService {

	@Autowired
    private MessageSource messageSource;
	
	@Autowired
	private DiaristaRepository diaristaRepository;
	
	@Autowired
	private UsuarioService usuarioService;

	public void saveDiarista(Diarista d) throws NegocioException {
		
		Usuario usu = usuarioService.findByEmail(d.getUsuario().getEmail());
		
		Diarista diarista = findByCpf(d.getCpf());
	
		try {
			if(diarista != null){
				throw new NegocioException(messageSource.getMessage("Este CPF já esta sendo utilizado por outro usuário", 
						  new Object[]{d.getNome()}, 
							  LocaleContextHolder.getLocale()));
			}else if(usu == null){
				diaristaRepository.save(d);
			}else{
				throw new NegocioException(messageSource.getMessage("Esse email já esta sendo utilizado por outro usuário", 
					  new Object[]{d.getNome()}, 
						  LocaleContextHolder.getLocale()));
			}
		} catch (NoSuchMessageException e) {
			throw new NegocioException(messageSource.getMessage("Erro ao inserir cliente: " + e.getMessage(), 
					  new Object[]{d.getNome()}, 
						  LocaleContextHolder.getLocale()));
		}
				
	}
	
	public void editarDiarista(Diarista diarista) throws NegocioException{

		try {
			diaristaRepository.save(diarista);
		} catch (Exception e) {
			throw new NegocioException("Erro ao atualizar perfil: " + e.getMessage());
		}
	}

	public void removeDiarista(Diarista d) throws NegocioException {
		diaristaRepository.delete(d);
		try {

		} catch (Exception e) {
			throw new NegocioException("Erro ao tentar Deletar Diarista");
		}
	}

	public List<Diarista> listToDiarista() throws NegocioException{
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
	
	public Diarista findByUsuario(Usuario usuario) throws NegocioException {
		try {
			return diaristaRepository.findByUsuario(usuario);
		} catch (Exception e) {
			throw new NegocioException("Erro ao tentar buscar diarista.");
		}
	}
	
	public Diarista findByIdUsuario(Integer idUsuario) throws NegocioException {
		try {
			return diaristaRepository.findByIdUsuario(idUsuario);
		} catch (Exception e) {
			throw new NegocioException("Erro ao tentar buscar diarista.");
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
	
	public List<Diarista> listaDiaristaPorRanqueamento()throws NegocioException{
		try {
			return diaristaRepository.findByRanqueamento();
		} catch (Exception e) {
			throw new NegocioException(e.getMessage());
		}
	}
}
