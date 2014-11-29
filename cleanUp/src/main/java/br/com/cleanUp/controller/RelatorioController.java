package br.com.cleanUp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.RelatorioDiarista;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.ClienteService;
import br.com.cleanUp.service.DiaristaService;
import br.com.cleanUp.service.HistoricoServicoService;
import br.com.cleanUp.service.RelatoriosService;
import br.com.cleanUp.util.AtributoDeSessao;
import br.com.cleanUp.vo.ResumoVO;

@Controller
@RequestMapping(value = "/protected/relatorios")
public class RelatorioController {

	@Autowired
	private HistoricoServicoService historicoServico;
	
	@Autowired
	private RelatoriosService relatoriosServico;
	
	@Autowired
	private ClienteService clienteServico;
	
	@Autowired
	private DiaristaService diaristaServico;
	
	@RequestMapping(value = "/relatorios", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView doGetServicos() {
        return new ModelAndView("relatorios");
    }
	
	@RequestMapping(value = "/gerarRelatorioDiarista", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public ResumoVO gerarRelatorioDiarista()throws NegocioException{
		RelatorioDiarista relatorio = new RelatorioDiarista();
		
		ResumoVO resumoVO = new ResumoVO();
		
		Usuario usuarioLogado = (Usuario) RequestContextHolder
				.currentRequestAttributes().getAttribute(AtributoDeSessao.LOGGED_USER, RequestAttributes.SCOPE_SESSION);
		
		Diarista d = new Diarista();
		d = diaristaServico.findByUsuario(usuarioLogado);	

			relatorio = relatoriosServico.relatorioDiarista(d);
			
			resumoVO.setNumeroBons(relatorio.getNumeroBons());
			resumoVO.setNumeroRegulares(relatorio.getNumeroRegulares());
			resumoVO.setNumeroRuins(relatorio.getNumeroRuins());

		return resumoVO;
	}
}
