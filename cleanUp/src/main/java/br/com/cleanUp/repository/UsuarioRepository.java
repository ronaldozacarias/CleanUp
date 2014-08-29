package br.com.cleanUp.repository;

import org.springframework.data.repository.CrudRepository;

import br.com.cleanUp.model.Usuario;

public interface UsuarioRepository extends CrudRepository<Usuario, Integer> {
    Usuario findByEmail(String email);
}
