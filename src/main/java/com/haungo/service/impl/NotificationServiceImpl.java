package com.haungo.service.impl;

import com.haungo.pojos.Notification;
import com.haungo.repository.NotificationRepository;
import com.haungo.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NotificationServiceImpl implements NotificationService {
    @Autowired private NotificationRepository notificationRepository;
    @Autowired private SimpMessagingTemplate messagingTemplate;

    @Override
    public List<Notification> getNotificationByUid(Integer uid) {
        return this.notificationRepository.getNotificationByUid(uid);
    }

    @Override
    public Notification addNotification(Notification notification) {
        messagingTemplate.convertAndSendToUser(notification.getUser().getUsername(),"/topic/pushNotification", notification);
        return this.notificationRepository.addNotification(notification);
    }

    @Override
    public boolean setSeen(Integer notificationId) {
        return this.notificationRepository.setSeen(notificationId);
    }
}
