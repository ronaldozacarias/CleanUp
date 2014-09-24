package br.com.cleanUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.repository.ClienteRepository;
import br.com.cleanUp.repository.UsuarioRepository;

@Service
@Transactional
public class ClienteService {
	
	@Autowired
    private MessageSource messageSource;
	
	@Autowired
    private ClienteRepository clienteRepository;
	
	@Autowired
	private UsuarioService usuarioService;

	public void salvarCliente(Cliente cli) throws NegocioException{
		//clienteRepository.save(cli);		
		Usuario usu = usuarioService.findByEmail(cli.getUsuario().getEmail());
		
		try {
			if(usu == null){
				clienteRepository.save(cli);
			}else{
				throw new NegocioException(messageSource.getMessage("error.login.exist", 
					  new Object[]{cli.getNome()}, 
						  LocaleContextHolder.getLocale()));
			}
		} catch (NoSuchMessageException e) {
			throw new NegocioException(messageSource.getMessage("error.insert.client", 
					  new Object[]{cli.getNome()}, 
						  LocaleContextHolder.getLocale()));
		}
	}
	
	public void editarCliente(Cliente cli) throws NegocioException{
		clienteRepository.delete(clienteRepository.findOne(cli.getCodigo()));
		//clienteRepository.save(cli);
		try {
			clienteRepository.save(cli);
		} catch (Exception e) {
			throw new NegocioException("ERRO AO TENTAR EDITAR CLIENTE");
		}
	}
	
	public void removerCliente(Cliente cli) throws NegocioException{
		//clienteRepository.delete(cli);
		try {
			clienteRepository.delete(cli);
		} catch (Exception e) {
			throw new NegocioException("ERRO AO TENTAR EXCUIR CLIENTE");
		}
	}
	
	public List<Cliente> listCliente() throws NegocioException{
		//return (List<Cliente>) clienteRepository.findAll();
		List<Cliente> retorno;
		 retorno = (List<Cliente>) clienteRepository.findAll();
		 try {
			if(retorno != null){
				System.out.println("Lista Retornado");
			}
		} catch (Exception e) {
			throw new NegocioException("Erro ao Listar os Clientes");
		}
		 return retorno;
	}
}
