package br.com.cleanUp.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cidade;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.StatusServico;
import br.com.cleanUp.model.TipoServico;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.ClienteService;
import br.com.cleanUp.service.ServicoService;
import br.com.cleanUp.util.AtributoDeSessao;
import br.com.cleanUp.vo.PessoaVO;
import br.com.cleanUp.vo.ServicoVO;

@Controller
@RequestMapping("/protected/servico/")
public class ServicoController {
	
	@Autowired
	private ServicoService servicoService;
	
	@Autowired
	private ClienteService clienteService;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView registrar() {
		return new ModelAndView("servico");
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void saved(@RequestBody ServicoVO servicoVO)throws NegocioException {
		
		Usuario usuario = (Usuario) RequestContextHolder.currentRequestAttributes()
								.getAttribute(AtributoDeSessao.LOGGED_USER, RequestAttributes.SCOPE_SESSION);
		
		Cliente cliente = clienteService.findByIdUsuario(usuario.getId());
		
//		Endereco e = new Endereco();
//		Endereco e1 = new Endereco();
//		Endereco eDiarista = new Endereco();
//		
//		e.setLat(10);
//		e.setLng(20);
//		e.setLogradouro("Rua Padre Guedes");
//		
//		e1.setLat(21);
//		e1.setLng(32);
//		e1.setLogradouro("Av. Jo�o de Souza Lima");
//		
//		eDiarista.setCodigo(1);
//		
		List<Endereco> listaE = servicoVO.getEnderecos();
//		listaE.add(e);
//		listaE.add(e1);
//		
//		Cliente c = new Cliente();
//		Diarista d = new Diarista();
//		Cidade ci = new Cidade();
//		Usuario u = new Usuario();
//		Usuario u2 = new Usuario();
//		
//		c.setCodigo(1);
//		d.setCodigo(1);
//		ci.setCodigoCidade(1);
//		u.setId(1);
//		u2.setId(2);
//		c.setCidade(ci);
//		d.setCidade(ci);
//		c.setUsuario(u2);
//		d.setUsuario(u);
//		d.setEndereco(e);
//		
		Servico servico = new Servico();
		
		servico.setStatus(StatusServico.PENDENTE);
		servico.setCliente(cliente);
		servico.setDiarista(servicoVO.getDiarista());
		servico.setDataServico(servicoVO.getData());
		servico.setDescricao(servicoVO.getDescricao());
//		
//		s.setCliente(c);
//		s.setDataServico(new Date());
//		s.setDescricao("Teste");
//		s.setDiarista(d);
//		s.setTipoServico(TipoServico.LAVAR);
//		s.setValor(200);
		
//		s.setStatus(StatusServico.PENDENTE);
		
		try {
			servicoService.save(servico, listaE);
		} catch (Exception e2) {
			System.out.println(e2.getMessage());
		}
	}
	
	@RequestMapping(value="cancelar", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public void cancelarServico(Servico s){
		Servico s1 = new Servico();
		s1.setDataServico(new Date());
		s1.setCodServico(4);
		try {
			servicoService.cancelarServico(s1);
		} catch (NegocioException e) {
			System.out.println(e.getMessage());
		}
	}
}