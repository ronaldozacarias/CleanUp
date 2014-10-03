package br.com.cleanUp.controller;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.StatusServico;
import br.com.cleanUp.model.TipoServico;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.ServicoService;

@Controller
@RequestMapping("/servico")
public class ServicoController {
	
	@Autowired
	private ServicoService servicoService;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView registrar() {
		return new ModelAndView("servico");
	}
	
	@RequestMapping(value="add", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public void saved(){
		/*Endereco e = new Endereco();
		Cliente c = new Cliente();
		Diarista d = new Diarista();
		Cidade ci = new Cidade();
		Usuario u = new Usuario();
		Usuario u2 = new Usuario();
		Servico s = new Servico();
		e.setCodigo(1);
		c.setCodigo(1);
		d.setCodigo(1);
		ci.setCodigoCidade(1);
		u.setId(1);
		u2.setId(2);
		c.setCidade(ci);
		d.setCidade(ci);
		c.setUsuario(u2);
		d.setUsuario(u);
		d.setEndereco(e);
		s.setCliente(c);
		s.setDataServico(new Date());
		s.setDescricao("Teste");
		s.setDiarista(d);
		s.setEndereco(e);
		s.setTipoServico(TipoServico.LAVAR);
		s.setValor(200);
		s.setStatus(StatusServico.PENDENTE);
		
		Endereco e1 = new Endereco();
		Cliente c1 = new Cliente();
		Diarista d1 = new Diarista();
		Cidade ci1 = new Cidade();
		Usuario u3 = new Usuario();
		Usuario u4 = new Usuario();
		Servico s1 = new Servico();
		e1.setCodigo(1);
		c1.setCodigo(1);
		d1.setCodigo(1);
		ci1.setCodigoCidade(1);
		u3.setId(1);
		u4.setId(2);
		c1.setCidade(ci);
		d1.setCidade(ci);
		c1.setUsuario(u2);
		d1.setUsuario(u);
		d1.setEndereco(e);
		s1.setCliente(c);
		s1.setDataServico(new Date());
		s1.setDescricao("Teste2");
		s1.setDiarista(d);
		s1.setEndereco(e);
		s1.setTipoServico(TipoServico.LIMPAR);
		s1.setValor(200);
		s1.setStatus(StatusServico.PENDENTE);
		
		ArrayList<Servico> lista = new ArrayList<Servico>();
		lista.add(s);
		lista.add(s1);*/
		Endereco e = new Endereco();
		Endereco e1 = new Endereco();
		Endereco eDiarista = new Endereco();
		
		e.setLat(10);
		e.setLog(20);
		e.setLogradouro("Rua Padre Guedes");
		
		e1.setLat(21);
		e1.setLog(32);
		e1.setLogradouro("Av. João de Souza Lima");
		
		eDiarista.setCodigo(1);
		
		ArrayList<Endereco> listaE = new ArrayList<Endereco>();
		listaE.add(e);
		listaE.add(e1);
		
		Cliente c = new Cliente();
		Diarista d = new Diarista();
		Cidade ci = new Cidade();
		Usuario u = new Usuario();
		Usuario u2 = new Usuario();
		
		c.setCodigo(1);
		d.setCodigo(1);
		ci.setCodigoCidade(1);
		u.setId(1);
		u2.setId(2);
		c.setCidade(ci);
		d.setCidade(ci);
		c.setUsuario(u2);
		d.setUsuario(u);
		d.setEndereco(e);
		
		Servico s = new Servico();
		
		s.setCliente(c);
		s.setDataServico(new Date());
		s.setDescricao("Teste");
		s.setDiarista(d);
		s.setTipoServico(TipoServico.LAVAR);
		s.setValor(200);
		s.setStatus(StatusServico.PENDENTE);
		try {
			servicoService.save(s,listaE);
		} catch (Exception e2) {
			System.out.println("Fudeu!!");
		}
}
	
}