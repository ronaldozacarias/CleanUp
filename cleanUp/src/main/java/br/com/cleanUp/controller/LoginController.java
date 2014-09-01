package br.com.cleanUp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class LoginController {

    @RequestMapping(value = "login", method = {RequestMethod.GET, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.PUT})
    public ModelAndView doGet() {
        return new ModelAndView("login");
    }
    
    @RequestMapping(value = "registrar", method = {RequestMethod.GET})
    public ModelAndView registrar() {
        return new ModelAndView("registrar");
    }
}
