package com.haungo.controllers;

import com.haungo.pojos.Notification;
import com.haungo.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NotificationWebController {
//    @Autowired
//    NotificationService notificationService;

//    @Autowired
//    private WSService service;

//    @PostMapping("/pushNotification")
//    public boolean pushNotification(@RequestBody Notification notification) {
//        Notification notification1 = notificationService.addNotification(notification);
//        if(notification1 != null)
//            return true;
//        return false;
//    }
//    @MessageMapping("/like")
//    public String handle(String uid) {
//        return "dsdhshu";
//    }
}
