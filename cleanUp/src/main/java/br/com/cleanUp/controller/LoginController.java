package br.com.cleanUp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.UsuarioService;
import br.com.cleanUp.util.Util;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	UsuarioService usuarioService;

    @RequestMapping(value = "login", method = {RequestMethod.GET, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.PUT})
    @ResponseBody
    public ModelAndView doGet() {
        return new ModelAndView("login");
    }
    
	@RequestMapping(value = "/mobile", method = RequestMethod.POST)
	public @ResponseBody
	String loginMobile(@RequestBody Usuario u) {
		
		try {
			Usuario user = usuarioService.compareUsuario(u);

			if (user.getEmail().equals(u.getEmail())
					&& user.getSenha().equals(u.getSenha())) {
				return Util.constructJSON("register", true);
			} else {
				return Util
						.constructJSON("register", false,
								"Special Characters are not allowed in Username and Password");
			}

		} catch (Exception e) {
			return Util.constructJSON("register", false, "Error occured");
		}

	}
   
}
