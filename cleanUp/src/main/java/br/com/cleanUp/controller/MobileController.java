package br.com.cleanUp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.cleanUp.exception.NegocioException;
import br.com.cleanUp.model.Diarista;

@Controller
@RequestMapping(value = "/mobile")
public class MobileController {

	@Autowired
	private DiaristaController diaristaController;
	
	
	@RequestMapping(value = "/cliente/listDiaristas", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Diarista> getDiaristas() throws NegocioException{
		
		return diaristaController.getAll();

	}
}
