package br.com.cleanUp.exception;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;

public class NegocioException extends Exception {
	
	public NegocioException() {
		// TODO Auto-generated constructor stub
	}

	public NegocioException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public NegocioException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	public NegocioException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public NegocioException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}
	
	public NegocioException(String message, MessageSource messageSource){
		super(messageSource.getMessage(message, null, LocaleContextHolder.getLocale()));
	}
	
	public NegocioException(String message, MessageSource messageSource, Object[] params){
		super(messageSource.getMessage(message, params, LocaleContextHolder.getLocale()));
	}	

}
