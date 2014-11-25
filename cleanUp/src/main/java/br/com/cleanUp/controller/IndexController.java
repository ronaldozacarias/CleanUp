package br.com.cleanUp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.base.Throwables;

@Controller
@RequestMapping(value = "/")
public class IndexController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("welcome");
    }
    
    @RequestMapping("error")
    @ResponseBody
    public String customError(HttpServletRequest request,
    		HttpServletResponse response, Model model) {

    	// retrieve some useful information from the request
    			Integer statusCode = (Integer) request
    					.getAttribute("javax.servlet.error.status_code");
    			Throwable throwable = (Throwable) request
    					.getAttribute("javax.servlet.error.exception");

    			// String servletName = (String)
    			// request.getAttribute("javax.servlet.error.servlet_name");
    			String exceptionMessage = getExceptionMessage(throwable, statusCode);
    					
    			if (exceptionMessage == null){
    				
    				exceptionMessage = "Erro inesperado: "+Throwables.getRootCause(throwable).toString()
    									+" "+
    									Throwables.getRootCause(throwable).getStackTrace()[0].toString();
    			}
    			
    			String requestUri = (String) request
    					.getAttribute("javax.servlet.error.request_uri");
    			if (requestUri == null) {
    				requestUri = "Unknown";
    			}

//    			String message = MessageFormat.format(
//    					"{0} returned for {1} with message {3}", statusCode,
//    					requestUri, exceptionMessage);
    			
    			String message = exceptionMessage;

    			model.addAttribute("errorMessage", message);
    			
    			return message;
    }

    private String getExceptionMessage(Throwable throwable, Integer statusCode) {
    	if (throwable != null) {
    		return Throwables.getRootCause(throwable).getMessage();
    	}
    	HttpStatus httpStatus = HttpStatus.valueOf(statusCode);
    	return httpStatus.getReasonPhrase();
    }
}

