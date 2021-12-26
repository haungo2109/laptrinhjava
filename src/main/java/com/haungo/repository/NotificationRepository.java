package com.haungo.repository;

import com.haungo.pojos.Notification;

import java.util.List;

public interface NotificationRepository {
    List<Notification> getNotificationByUid(Integer uid);
    Notification addNotification(Notification notification);
    boolean setSeen(Integer notificationId);
}
