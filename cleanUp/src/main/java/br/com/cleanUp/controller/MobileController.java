package br.com.cleanUp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.Severity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Endereco;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.ClienteService;
import br.com.cleanUp.service.DiaristaService;
import br.com.cleanUp.service.ServicoService;
import br.com.cleanUp.vo.AceitarServicoVO;
import br.com.cleanUp.vo.ServicoVO;

@Controller
@RequestMapping(value = "/mobile")
public class MobileController {

	@Autowired
	private DiaristaController diaristaController;

	@Autowired
	private DiaristaService diaristaService;

	@Autowired
	private ServicoService servicoService;
	
	@Autowired
	private ServicoController servicoController;

	@Autowired
	private ClienteService clienteService;

	@RequestMapping(value = "/cliente/listDiaristas", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Diarista> getDiaristas() throws NegocioException {

		return diaristaController.getAll();

	}

	@RequestMapping(value = "/servico/{tipoUsuario}/{codigoUsuario}", method = RequestMethod.GET)
	@ResponseBody
	public List<Servico> ServicoPorDiaristaSimples(
			@PathVariable String tipoUsuario,
			@PathVariable Integer codigoUsuario) throws NegocioException {

		List<Servico> listaServicos = null;

		Usuario usuario = new Usuario();
		usuario.setId(codigoUsuario);

		System.out.println(usuario.getId());

		if (tipoUsuario.equals("diarista")) {
			Diarista diarista = diaristaService.findByUsuario(usuario);

			if (diarista != null) {
				listaServicos = servicoService.listServiceToDiarista(diarista
						.getCodigo());
			}
		} else {

			Cliente cliente = clienteService.findByIdUsuario(usuario.getId());
			if (cliente != null) {
				listaServicos = clienteService
						.listaDeServicoPorCliente(cliente);
			}

		}

		return listaServicos;
	}
	
	@RequestMapping(value = "/servico/confirmar", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void confirmaServico(Servico servico) throws NegocioException {
		
		AceitarServicoVO asvo  = new AceitarServicoVO();
		asvo.getServicosVO().add(servico);
		diaristaController.confirmacaoDeServico(asvo);

	}
	
	@RequestMapping(value = "/servico/cancelar", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void cancelarServico(Servico servico) throws NegocioException {
		ServicoVO serv = new ServicoVO();
		ArrayList<Endereco> enderecos = new ArrayList<Endereco>();
		enderecos.add(servico.getEndereco());
		serv.setCliente(servico.getCliente());
		serv.setDiarista(servico.getDiarista());
		serv.setDescricao(servico.getDescricao());
		serv.setEnderecos(enderecos);
		serv.setCodigo(servico.getCodServico());
		serv.setData(servico.getDataServico());
		servicoController.cancelarServico(serv);

	}
	
	/*
	@RequestMapping(value = "/servico/classifica", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void classificaServico(ServicoVO servico) throws NegocioException {

		servicoController.classificaServico(servico);

	}*/

}
