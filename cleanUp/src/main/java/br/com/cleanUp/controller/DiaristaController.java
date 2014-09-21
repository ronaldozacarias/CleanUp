package br.com.cleanUp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Especialidade;
import br.com.cleanUp.model.Perfil;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.DiaristaService;
import br.com.cleanUp.service.EspecialidadeService;
import br.com.cleanUp.vo.PessoaVO;

@Controller
@RequestMapping(value = "/public/diarista")
public class DiaristaController {
	
	Diarista diarista;
	Usuario usuario;
	Cidade cidade;
	Endereco endereco;
	
	@Autowired
	private DiaristaService diaristaService;
	
	@Autowired
	private EspecialidadeService especialidadeService;
	
	@RequestMapping(method = RequestMethod.GET)
    public ModelAndView registrar() {
        return new ModelAndView("diarista");
    }

	@RequestMapping(method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
    public void create(@RequestBody PessoaVO pessoa) throws NegocioException {
		
		//System.out.println("#####" + pessoa.getEspecialidades());
		ArrayList<Especialidade> especialidadeDiarista = new ArrayList<Especialidade>();
//		Especialidade especialidade1 = new Especialidade();
//		Especialidade especialidade2 = new Especialidade();
//		
//		especialidade1.setCodigoEspecialidade(1);
//		especialidade2.setCodigoEspecialidade(3);
//		
//		especialidadeDiarista.add(especialidade1);
//		especialidadeDiarista.add(especialidade2);
		
//		ArrayList<Especialidade> especialidadeDiarista = new ArrayList<Especialidade>();
		Especialidade espe;
		endereco = new Endereco();
		endereco.setEndereco(pessoa.getEndereco());
//		
		for(int i = 0; i < pessoa.getEspecialidades().length; i++){
			espe = new Especialidade();
			espe.setCodigoEspecialidade(pessoa.getEspecialidades()[i]);
			especialidadeDiarista.add(espe);
		}
        
		diarista = new Diarista();
		cidade = new Cidade();
		cidade.setCodigoCidade(Integer.parseInt(pessoa.getCidade()));
		usuario = new Usuario();
		usuario.isAtivo();
		usuario.setEmail(pessoa.getEmail());
		usuario.setPerfil(Perfil.ROLE_DIARIST);
		usuario.setSenha(pessoa.getSenha());
		
		diarista.setCidade(cidade);
		diarista.setCpf(pessoa.getCpf());
		diarista.setEndereco(endereco);
		diarista.setNome(pessoa.getNome());		
		diarista.setEspecialidades(especialidadeDiarista);		
		diarista.setTelefone(pessoa.getTelefone());
		diarista.setUsuario(usuario);			
		
		diaristaService.saveDiarista(diarista);

    }
	
	@RequestMapping(method = RequestMethod.PUT, produces = "application/json")
	@ResponseBody
    public void edit(@ModelAttribute("pessoa") PessoaVO pessoa) throws NegocioException {
		
//		ArrayList<Especialidade> especialidadeDiarista = new ArrayList<Especialidade>();
//		Especialidade espe;
//		
//		for(int i = 0; i < pessoa.getEspecialidades().size(); i++){
//			espe = new Especialidade();
//			espe.setCodigoEspecialidade(pessoa.getEspecialidades().get(i));
//			especialidadeDiarista.add(espe);
		endereco = new Endereco();
		endereco.setEndereco(pessoa.getEndereco());
//		}
        
		diarista = new Diarista();
		cidade = new Cidade();
		cidade.setCodigoCidade(Integer.parseInt(pessoa.getCidade()));
		usuario = new Usuario();
		usuario.isAtivo();
		usuario.setEmail(pessoa.getEmail());
		usuario.setPerfil(Perfil.ROLE_DIARIST);
		usuario.setSenha(pessoa.getSenha());
		
		diarista.setCidade(cidade);
		diarista.setCpf(pessoa.getCpf());
		diarista.setEndereco(endereco);
		diarista.setNome(pessoa.getNome());
//		diarista.setEspecialidades(especialidadeDiarista);
		diarista.setTelefone(pessoa.getTelefone());
		diarista.setUsuario(usuario);
		
		diaristaService.editDiarista(diarista);

    }
	
	@RequestMapping(method = RequestMethod.DELETE, produces = "application/json")
	@ResponseBody
    public void delete(@ModelAttribute("pessoa") Diarista id) throws NegocioException {
			
		diaristaService.removeDiarista(id);

    }
	
	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
    public List<Diarista> getAll() throws NegocioException {
			
		return  diaristaService.listToDiarista();

    }
	
	@RequestMapping(value = "getEspecialidades", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody		
	public List<Especialidade> todasEspecialidades(){
		
		List<Especialidade> listaDeEspecialidades = especialidadeService.todasEspecialidadesList();
		
		return listaDeEspecialidades;
		
	}
}
