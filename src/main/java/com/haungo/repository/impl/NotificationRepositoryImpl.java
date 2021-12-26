package com.haungo.repository.impl;

import com.haungo.pojos.Category;
import com.haungo.pojos.Notification;
import com.haungo.repository.NotificationRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class NotificationRepositoryImpl implements NotificationRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Notification> getNotificationByUid(Integer uid) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Notification N WHERE N.user.id=:id");
        q.setParameter("id", uid);
        List<Notification>  notifications = q.getResultList();
        return notifications;
    }

    @Override
    public Notification addNotification(Notification notification) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(notification);
            return notification;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return null;
    }

    @Override
    public boolean setSeen(Integer notificationId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try {
            Notification notification = session.get(Notification.class, notificationId);
            notification.setSeen(true);
            session.update(notification);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }
}
