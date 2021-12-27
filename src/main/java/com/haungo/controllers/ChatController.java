package com.haungo.controllers;

import com.haungo.pojos.Message;
import com.haungo.pojos.User;
import com.haungo.service.MessageService;
import com.haungo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@Controller
public class ChatController {
    @Autowired MessageService messageService;
    @Autowired UserService userDetailsService;

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    @MessageMapping("/message")
    public void sendPrivateMessage(@Payload Message message, SimpMessageHeaderAccessor headerAccessor) {
        System.out.println(message.getContent());
        this.simpMessagingTemplate.convertAndSendToUser("haungo", "/queue/chats",  message.getContent());
//        User user = (User) session.getAttribute("currentUser");
//        User userTo = this.userDetailsService.getUserById(Integer.parseInt(message.getToUserId()));
//
//        if (user == null || userTo == null){
//            return message;
//        }
//        message.setFrom(user);
//        message.setTo(userTo);
//        Message message1 = messageService.addMessage(message);
//        if (message1 == null){
//            return message;
//        }
    }
}
