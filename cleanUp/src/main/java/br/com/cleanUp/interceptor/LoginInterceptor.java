package br.com.cleanUp.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import br.com.cleanUp.model.Usuario;
import br.com.cleanUp.service.UsuarioService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private UsuarioService usuarioService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if(usuario == null){
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String email = auth.getName();
            usuario = usuarioService.findByEmail(email);
            session.setAttribute("usuario", usuario);
        }

        return super.preHandle(request, response, handler);
    }
}
