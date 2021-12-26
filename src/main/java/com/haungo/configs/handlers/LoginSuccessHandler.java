package com.haungo.configs.handlers;

import com.haungo.pojos.User;
import com.haungo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    @Autowired
    private UserService userDetailsService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication a) throws IOException, ServletException {
        User u = this.userDetailsService.getUserByUsername(a.getName());
        request.getSession().setAttribute("currentUser", u);
        if (u.getUserRole().equals(User.ADMIN)) response.sendRedirect("/laptrinhjava/admin");
        else response.sendRedirect("/laptrinhjava/");
    }
}
