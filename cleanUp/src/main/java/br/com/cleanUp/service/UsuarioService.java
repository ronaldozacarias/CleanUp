package br.com.cleanUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.repository.UsuarioRepository;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository userRepository;

    public Usuario findByEmail(String email){
        return userRepository.findByEmail(email);
    }
}
