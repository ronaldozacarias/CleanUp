package br.com.cleanUp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Queixa;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.ClienteService;
import br.com.cleanUp.service.DiaristaService;
import br.com.cleanUp.service.QueixaService;
import br.com.cleanUp.util.AtributoDeSessao;

@Controller
@RequestMapping("/protected/queixa/")
public class QueixaController {
	
	Usuario usuario;
	Cliente cliente;

	@Autowired
	private QueixaService queixaService;
	
	@Autowired
	private ClienteService clienteService;
	
	@Autowired
	private DiaristaService diaristaService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView registrar() {
		return new ModelAndView("queixa");
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public void salvarQueixa(/*Queixa q*/)throws NegocioException{
		
		usuario = new Usuario();
		
		usuario = (Usuario) RequestContextHolder.currentRequestAttributes().getAttribute(AtributoDeSessao.LOGGED_USER,
						RequestAttributes.SCOPE_SESSION);
		Queixa q = new Queixa();
		Diarista d = new Diarista();
		List<String> mensagens = new ArrayList<String>();
		mensagens.add("Teste de Queixa!!!");
		try {
			d = diaristaService.findByCpf("12345678900");
			cliente = new Cliente();
			cliente = clienteService.findByIdUsuario(usuario.getId());
			q.setCliente(cliente);
			q.setMensagem(mensagens);
			q.setDiarista(d);
			queixaService.saved(q);
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
	}
	
	@RequestMapping(value="feedBack", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public void editarQueixa(Queixa q)throws NegocioException{
		
		try {
			queixaService.edit(q);
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
	}
	
	@RequestMapping(value="listaQueixas", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Queixa> listaDeQueixas()throws NegocioException{
		ArrayList<Queixa> listaQueixas = new ArrayList<Queixa>();
		try {
			listaQueixas = (ArrayList<Queixa>) queixaService.listaDeQueixas();
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
		return listaQueixas;
	}
	
	@RequestMapping(value="listaQueixasPorCliente", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Queixa> listaDeQueixasPorCliente(Cliente c)throws NegocioException{
		ArrayList<Queixa> listaQueixas = new ArrayList<Queixa>();
		try {
			listaQueixas = (ArrayList<Queixa>) queixaService.listaDeQueixasPorCliente(c);
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
		return listaQueixas;
	}
	
	@RequestMapping(value="listaQueixasPorDiaristas", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Queixa> listaDeQueixasPorDiarista(Diarista d)throws NegocioException{
		ArrayList<Queixa> listaQueixas = new ArrayList<Queixa>();
		try {
			listaQueixas = (ArrayList<Queixa>) queixaService.listaDeQueixasPorDiarista(d);
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
		return listaQueixas;
	}
}
