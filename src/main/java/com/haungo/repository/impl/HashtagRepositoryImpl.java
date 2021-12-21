package com.haungo.repository.impl;

import com.haungo.pojos.Hashtag;
import com.haungo.repository.HashtagRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class HashtagRepositoryImpl implements HashtagRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Hashtag getHashtagById(Integer id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        return session.get(Hashtag.class, id);
    }

    @Override
    public List<Hashtag> getHashtags() {
        Session session = sessionFactory.getObject().getCurrentSession();
        return session.createQuery("FROM Hashtag").getResultList();
    }

    @Override
    public Hashtag addHashtag(Hashtag hashtag) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(hashtag);
            return hashtag;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return hashtag;
    }

    @Override
    public Hashtag getHashtagByName(String name) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Hashtag H WHERE H.name = :name");
        q.setParameter("name", name);
        List<Hashtag> hashtags = q.getResultList();
        if (hashtags == null || hashtags.isEmpty()) return null;
        else return hashtags.get(0);
    }
}