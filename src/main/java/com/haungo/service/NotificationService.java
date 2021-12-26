package com.haungo.service;

import com.haungo.pojos.Notification;

import java.util.List;

public interface NotificationService {
    List<Notification> getNotificationByUid(Integer uid);
    Notification addNotification(Notification notification);
    boolean setSeen(Integer notificationId);
}
