//package br.com.cleanUp.controller;
//
//import java.util.Date;
//import java.util.List;
//import java.util.Locale;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import br.com.cleanUp.model.Diarista;
//import br.com.cleanUp.service.ClienteService;
//import br.com.cleanUp.service.ServicoService;
//
//@Controller
//@RequestMapping("/sevico")
//public class ServicoController {
//
//	@Autowired
//	private ServicoService servicoService;
//
//	// private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";
//
//	public List<Servico> getDiaLivre(Diarista diarista) {
//
//		Servico s = new Servico();
//		s.setDiarista(diarista);
//
//		servicoService.getDiaLivre(s);
//	}
//
//}
