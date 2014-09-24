package br.com.cleanUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.repository.ClienteRepository;

@Service
@Transactional
public class ClienteService {
	
	@Autowired
    private ClienteRepository clienteRepository;

	public void salvarCliente(Cliente cli) throws NegocioException{
		//clienteRepository.save(cli);
		try {
			clienteRepository.save(cli);
		} catch (Exception e) {
			throw new NegocioException("Erro ao tentar Inserir o Cliente");
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
	
	public Cliente findByCpf(String cpf) throws NegocioException {
		try {
			return clienteRepository.findByCpf(cpf);
		} catch (Exception e) {
			throw new NegocioException("Erro ao tentar buscar Cliente.");
		}
	}
}
