package br.com.cleanUp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Servico;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.ClienteService;
import br.com.cleanUp.service.DiaristaService;
import br.com.cleanUp.service.ServicoService;

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

}
