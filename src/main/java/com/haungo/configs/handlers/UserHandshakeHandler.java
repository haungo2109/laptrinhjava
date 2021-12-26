package com.haungo.configs.handlers;

import com.haungo.pojos.User;
import com.haungo.service.UserService;
import com.sun.security.auth.UserPrincipal;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

import java.security.Principal;
import java.util.Map;
import java.util.UUID;

public class UserHandshakeHandler extends DefaultHandshakeHandler {
    @Autowired private UserService userDetailsService;

    @Override
    protected Principal determineUser(ServerHttpRequest request, WebSocketHandler wsHandler, Map<String, Object> attributes) {
        if (request.getPrincipal().getName() != null) {
            User u = this.userDetailsService.getUserByUsername(request.getPrincipal().getName());
            return new UserPrincipal(u.getId().toString());
        }
        String randomId = UUID.randomUUID().toString();
        return new UserPrincipal(randomId);
    }
}
