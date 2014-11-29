package br.com.cleanUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.repository.UsuarioRepository;

@Service
@Transactional
public class UsuarioService {

    @Autowired
    private UsuarioRepository userRepository;

    public Usuario findByEmail(String email){
        return userRepository.findByEmail(email);
    }
    
    public Usuario compareUsuario(Usuario usuario){
        return userRepository.findByEmailAndSenha(usuario.getEmail(), usuario.getSenha());
    }


}
