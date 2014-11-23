package br.com.cleanUp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Favorito;
import br.com.cleanUp.repository.FavoritoRepository;

@Service
@Transactional
public class FavoritoService {

	@Autowired
	private FavoritoRepository favoritoRepository;
	
	public void savad(Favorito f)throws NegocioException{
		Favorito favorito = new Favorito();
		try {
			favorito = favoritoRepository.favoritoPorDiarista(f.getDiarista().getCodigo(), f.getCliente().getCodigo());
			if(favorito == null){
				favoritoRepository.save(f);
			}
		} catch (Exception e) {
			throw new NegocioException(e.getMessage());
		}
	}
	
	public void remove(Favorito f)throws NegocioException{
		try {
			favoritoRepository.delete(f);
		} catch (Exception e) {
			throw new NegocioException("Erro ao remover favorito");
		}
	}
	
	public List<Favorito> listaFavoritoPorCliente(Cliente c)throws NegocioException{
		try {
			return favoritoRepository.listarFavoritoPorCliente(c.getCodigo());
		} catch (Exception e) {
			throw new NegocioException("Erro ao listar favoritos");
		}
	}
}
