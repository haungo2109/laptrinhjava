package com.haungo.repository.impl;

import com.haungo.pojos.FeedImage;
import com.haungo.repository.FeedImageRepository;
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
public class FeedImageRepositoryImpl implements FeedImageRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<FeedImage> getImageByFeedId(Integer feedId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM FeedImage F WHERE F.feed=:loc ");
        q.setParameter("loc", feedId);
        return q.getResultList();
    }

    @Override
    public boolean addFeedImage(FeedImage feedImage) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(feedImage);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean deleteImageByFeedId(Integer id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Query q = session.createQuery("DELETE FeedImage F WHERE F.feed.id =:id");
            q.setParameter("id", id);
            q.executeUpdate();
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }
}
