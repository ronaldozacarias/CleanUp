package br.com.cleanUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.repository.ClienteRepository;

@Service
@Transactional
public class ClienteService {
	
	@Autowired
    private ClienteRepository clienteRepository;

	public void salvarCliente(Cliente cli){
		clienteRepository.save(cli);
	}
	
	public void editarCliente(Cliente cli){
		clienteRepository.delete(clienteRepository.findOne(cli.getCodigo()));
		clienteRepository.save(cli);
	}
	
	public void removerCliente(Cliente cli){
		clienteRepository.delete(cli);
	}
	
	public List<Cliente> listCliente(){
		return (List<Cliente>) clienteRepository.findAll();
	}
}
