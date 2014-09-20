package br.com.cleanUp.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import br.com.cleanUp.model.Perfil;
import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.util.AtributoDeSessao;
import br.com.cleanUp.vo.PessoaVO;

@Controller
@RequestMapping(value = "/protected/home")
public class HomeController {

    @RequestMapping(method = {RequestMethod.GET, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.PUT})
    public String redirect(){
    	
    	Usuario usuarioLogado = (Usuario)RequestContextHolder.currentRequestAttributes()    			
				.getAttribute(AtributoDeSessao.LOGGED_USER, RequestAttributes.SCOPE_SESSION);
    	
    	if(usuarioLogado.getPerfil().equals(Perfil.ROLE_CLIENT)){
    		return "welcomeClient";
    	}else if(usuarioLogado.getPerfil().equals(Perfil.ROLE_DIARIST)){
    		return "welcomeDiarist";
    	}else{
    		return "login";
    	}	
    	
    }

    @RequestMapping(method = {RequestMethod.GET, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.PUT}, produces = "application/json")
    public ResponseEntity<?> doGetAjax() {
        return new ResponseEntity<Object>(HttpStatus.FORBIDDEN);
    }
    
    @RequestMapping(value = "todasDiaristasCliente", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void create(@ModelAttribute("pessoa") PessoaVO pessoa) {}
}
