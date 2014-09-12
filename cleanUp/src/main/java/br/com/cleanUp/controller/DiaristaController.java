package br.com.cleanUp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Perfil;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.DiaristaService;
import br.com.cleanUp.vo.PessoaVO;

@Controller
@RequestMapping(value = "/public/diarista")
public class DiaristaController {
	
	Diarista diarista;
	Usuario usuario;
	Cidade cidade;
	
	@Autowired
	private DiaristaService diaristaService;
	
	@RequestMapping(method = RequestMethod.GET)
    public ModelAndView registrar() {
        return new ModelAndView("diarista");
    }

	@RequestMapping(method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
    public void create(@ModelAttribute("pessoa") PessoaVO pessoa) {
        
		diarista = new Diarista();
		cidade = new Cidade();
		cidade.setCodigoCidade(pessoa.getCidade());
		usuario = new Usuario();
		usuario.isAtivo();
		usuario.setEmail(pessoa.getEmail());
		usuario.setPerfil(Perfil.ROLE_DIARIST);
		usuario.setSenha(pessoa.getSenha());
		
		diarista.setCidade(cidade);
		diarista.setCpf(pessoa.getCpf());
		diarista.setEndereco(pessoa.getEndereco());
		diarista.setNome(pessoa.getNome());
		diarista.setEspecialidade(pessoa.getEspecialidades());
		diarista.setTelefone(pessoa.getTelefone());
		diarista.setUsuario(usuario);			
		
		diaristaService.saveDiarista(diarista);

    }
	
	@RequestMapping(method = RequestMethod.PUT, produces = "application/json")
	@ResponseBody
    public void edit(@ModelAttribute("pessoa") PessoaVO pessoa) {
        
		diarista = new Diarista();
		cidade = new Cidade();
		cidade.setCodigoCidade(pessoa.getCidade());
		usuario = new Usuario();
		usuario.isAtivo();
		usuario.setEmail(pessoa.getEmail());
		usuario.setPerfil(Perfil.ROLE_DIARIST);
		usuario.setSenha(pessoa.getSenha());
		
		diarista.setCidade(cidade);
		diarista.setCpf(pessoa.getCpf());
		diarista.setEndereco(pessoa.getEndereco());
		diarista.setNome(pessoa.getNome());
		diarista.setEspecialidade(pessoa.getEspecialidades());
		diarista.setTelefone(pessoa.getTelefone());
		diarista.setUsuario(usuario);
		
		diaristaService.editDiarista(diarista);

    }
	
	@RequestMapping(method = RequestMethod.DELETE, produces = "application/json")
	@ResponseBody
    public void delete(@ModelAttribute("pessoa") Diarista id) {
			
		diaristaService.removeDiarista(id);

    }
	
	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
    public List<Diarista> getAll() {
			
		return  diaristaService.listToDiarista();

    }
}
