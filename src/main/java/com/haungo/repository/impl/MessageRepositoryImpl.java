package com.haungo.repository.impl;

import com.haungo.pojos.Message;
import com.haungo.repository.MessageRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Repository
@Transactional
public class MessageRepositoryImpl implements MessageRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Message getMessageById(Integer id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        return session.get(Message.class, id);
    }

    @Override
    public List<Message> getMessageByUserId(Integer uid) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Message M WHERE M.to.id =:id");
        q.setParameter("id", uid);
        return q.getResultList();
    }

    @Override
    public List<Message> getMessageByAuctionId(Integer auctionId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Message M WHERE M.auction.id =:id");
        q.setParameter("id", auctionId);
        return q.getResultList();
    }

    @Override
    public Message addMessage(Message message) {
        Session session = sessionFactory.getObject().getCurrentSession();
        message.setCreateAt(new Date());
        session.save(message);
        return message;
    }
}
