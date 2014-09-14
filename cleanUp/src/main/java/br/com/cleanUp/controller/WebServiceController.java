package br.com.cleanUp.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.util.RestURIConstants;
import br.com.cleanUp.util.Util;

@Controller
public class WebServiceController {

	// @RequestMapping(value = "/{name}", method = RequestMethod.GET)
	// public @ResponseBody
	// String getGreeting(@PathVariable String name) {
	// String result = "Hello " + name;
	// return result;
	// }

	@RequestMapping(value = RestURIConstants.LOGIN_USU, method = RequestMethod.POST)
	public @ResponseBody
	String doLogin(@RequestBody Usuario u) {
		String response = "";
		int retCode = 0;

		if (u.getEmail().equals("tom@tom.com") && u.getSenha().equals("tom")) {
			retCode = 1;
		} else {
			retCode = 2;
		}

		if (retCode == 1) {
			response = Util.constructJSON("register", true);
		} else if (retCode == 2) {
			response = Util.constructJSON("register", false,
					"You are already registered");
		} else if (retCode == 3) {
			response = Util
					.constructJSON("register", false,
							"Special Characters are not allowed in Username and Password");
		} else if (retCode == 4) {
			response = Util.constructJSON("register", false, "Error occured");
		}
		return response;

	}

}
