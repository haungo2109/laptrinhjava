package com.haungo.repository.impl;

import com.haungo.pojos.Rating;
import com.haungo.service.RatingRepository;
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
public class RatingRepositoryImpl implements RatingRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Rating> getRatingByUserId(Integer uid) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Rating R WHERE R.user.id=:id");
        q.setParameter("id", uid);

        return q.getResultList();
    }

    @Override
    public List<Rating> getRatingByAuctionId(Integer id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Rating R WHERE R.auction.id=:id");
        q.setParameter("id", id);

        return q.getResultList();
    }

    @Override
    public Rating addRating(Rating rating) {
        Session session = sessionFactory.getObject().getCurrentSession();
        rating.setCreateAt(new Date());
        session.save(rating);
        return rating;
    }
}
