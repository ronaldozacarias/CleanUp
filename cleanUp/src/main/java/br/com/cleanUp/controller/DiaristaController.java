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
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.StatusServico;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.DiaristaService;
import br.com.cleanUp.service.EspecialidadeService;
import br.com.cleanUp.service.ServicoService;
import br.com.cleanUp.vo.PessoaVO;

@Controller
@RequestMapping(value = "/protected/diarista")
public class DiaristaController {

	Diarista diarista;
	Usuario usuario;
	Cidade cidade;
	Endereco endereco;
	static ArrayList<Servico> SERVICO = new ArrayList<Servico>();

	@Autowired
	private DiaristaService diaristaService;

	@Autowired
	private EspecialidadeService especialidadeService;
	
	@Autowired
	private ServicoService servicoService;

	@RequestMapping(method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void create(@RequestBody PessoaVO pessoa) throws NegocioException {
		
		ArrayList<Especialidade> especialidadeDiarista = new ArrayList<Especialidade>();
		Especialidade espe;
		endereco = new Endereco();
		endereco.setLogradouro(pessoa.getEndereco());
		//
		for (int i = 0; i < pessoa.getEspecialidades().length; i++) {
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
	public void edit(@ModelAttribute("pessoa") PessoaVO pessoa)
			throws NegocioException {


		endereco = new Endereco();
		endereco.setLogradouro(pessoa.getEndereco());

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
		// diarista.setEspecialidades(especialidadeDiarista);
		diarista.setTelefone(pessoa.getTelefone());
		diarista.setUsuario(usuario);

		diaristaService.editDiarista(diarista);

	}

	@RequestMapping(method = RequestMethod.DELETE, produces = "application/json")
	@ResponseBody
	public void delete(@ModelAttribute("pessoa") Diarista id)
			throws NegocioException {

		diaristaService.removeDiarista(id);

	}

	@RequestMapping(value = "listarDiaristas", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Diarista> getAll() throws NegocioException{

		return diaristaService.listToDiarista();

	}

	@RequestMapping(value = "getEspecialidades", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<Especialidade> todasEspecialidades() {

		List<Especialidade> listaDeEspecialidades = especialidadeService
				.todasEspecialidadesList();

		return listaDeEspecialidades;

	}

	public Diarista findByCpf(String cpf) throws NegocioException {
		return diaristaService.findByCpf(cpf);
	}
	
	public void solicitacaoDeServico(ArrayList<Servico> s){
		this.SERVICO = s;
	}
	
	@RequestMapping(value = "getSolicitacaoDeServico", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public ArrayList<Servico> getSolicitacaoDeServico(){
		return this.SERVICO;
	}
	
	@RequestMapping(value = "confirmacao", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public void confirmacaoDeServico(/*Servico serv*/){
		//this.servico = serv;
		try {
			for (int i = 0; i < this.SERVICO.size(); i++) {
				this.SERVICO.get(i).setStatus(StatusServico.ATIVO);
			}
			this.servicoService.edit(this.SERVICO);
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
	}
	
	@RequestMapping(value = "listaDiaristaPorCidade", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Diarista> listaDiaristaPorCidade(/*Cidade c*/){
		Cidade c = new Cidade();
		c.setCodigoCidade(2);
		ArrayList<Diarista> listaD = new ArrayList<Diarista>();
		try {
			listaD = (ArrayList<Diarista>) diaristaService.listaDeDiaristaPorCidade(c);
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
		return listaD;
	}
}
