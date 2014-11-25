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
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.repository.ClienteRepository;
import br.com.cleanUp.repository.ServicoRepository;

@Service
@Transactional
public class ClienteService {
	
	@Autowired
    private MessageSource messageSource;
	
	@Autowired
    private ClienteRepository clienteRepository;
	
	@Autowired
	private UsuarioService usuarioService;	
	
	@Autowired
	private ServicoRepository servicoRepository;

	public void salvarCliente(Cliente cli) throws NegocioException{
		
		Usuario usu = usuarioService.findByEmail(cli.getUsuario().getEmail());
		
		try {
			if(usu == null){
				clienteRepository.save(cli);
			}else{
				throw new NegocioException(messageSource.getMessage("Esse email já esta sendo utilizado por outro usuário", 
					  new Object[]{cli.getNome()}, 
						  LocaleContextHolder.getLocale()));
			}
		} catch (NoSuchMessageException e) {
			throw new NegocioException(messageSource.getMessage("Erro ao inserir cliente: " + e.getMessage(), 
					  new Object[]{cli.getNome()}, 
						  LocaleContextHolder.getLocale()));
		}
	}
	
	public void editarCliente(Cliente cli) throws NegocioException{
		clienteRepository.delete(clienteRepository.findOne(cli.getCodigo()));
		
		try {
			clienteRepository.save(cli);
		} catch (Exception e) {
			throw new NegocioException("ERRO AO TENTAR EDITAR CLIENTE");
		}
	}
	
	public void removerCliente(Cliente cli) throws NegocioException{
		
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
	
	public Cliente findByCpf(String cpf) throws NegocioException {
		try {
			return clienteRepository.findByCpf(cpf);
		} catch (Exception e) {
			throw new NegocioException("Erro ao tentar buscar Cliente.");
		}
	}
	
	public Cliente findByIdUsuario(int idUsuario) throws NegocioException {
		try {
			return clienteRepository.findByIdUsuario(idUsuario);
		} catch (Exception e) {
			throw new NegocioException("Erro ao tentar buscar Cliente.");
		}
	}
	
	public ArrayList<Servico> listaDeServicoPorCliente(Cliente c)throws NegocioException{
		ArrayList<Servico> listServico = new ArrayList<Servico>();
		try {
			listServico = this.servicoRepository.listarServicosPorCliente(c.getCodigo());
		} catch (Exception e) {
			throw new NegocioException();
		}
		return listServico;
	}
}
