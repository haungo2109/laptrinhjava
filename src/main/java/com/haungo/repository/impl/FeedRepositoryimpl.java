package com.haungo.repository.impl;

import com.haungo.pojos.*;
import com.haungo.repository.FeedImageRepository;
import com.haungo.repository.FeedRepository;
import com.haungo.repository.HashtagRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.*;

@Repository
public class FeedRepositoryimpl implements FeedRepository {

    @Autowired
    private HashtagRepository hashtagRepository;
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private FeedImageRepository feedImageRepository;

    @Override
    @Transactional
    public List<Feed> getFeeds(Map<String, String> params) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Feed> query = builder.createQuery(Feed.class);
        Root root = query.from(Feed.class);
        query = query.select(root);

        String kw = params.getOrDefault("kw", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));

        if (kw != null) {
            Predicate p = builder.like(root.get("content").as(String.class), String.format("%%%s%%", kw));
            query = query.where(p);
        }

        query = query.orderBy(builder.desc(root.get("createAt")));

        Query q = session.createQuery(query);

        int max = 5;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);

        return q.getResultList();
    }

    @Override
    @Transactional
    public Feed getFeedById(Integer id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        return session.get(Feed.class, id);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Feed addFeed(Feed feed) {
        feed.setCreateAt(new Date());
        feed.setCountComment(0);
        feed.setActive(true);
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            session.save(feed);
            if (feed.getImages() != null && !feed.getImages().isEmpty()) {
                for (FeedImage feedImage : feed.getImages()) {
                    feedImage.setFeed(feed);
                    session.save(feedImage);
                }
            }
            return feed;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }

        return null;
    }

    @Override
    @Transactional
    public Feed updateFeed(Feed feed) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try {
            Feed feed1 = session.get(Feed.class, feed.getId());
            if (feed.getContent() != null){
                feed1.setContent(feed.getContent());
                feed1.setHashtags(feed.getHashtags());
            }
            session.update(feed1);
            if (feed.getImages() != null && !feed.getImages().isEmpty()) {
                this.feedImageRepository.deleteImageByFeedId(feed1.getId());
                for (FeedImage feedImage : feed.getImages()) {
                    feedImage.setFeed(feed1);
                    session.save(feedImage);
                }
            }
            return feed;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return null;
    }

    @Override
    @Transactional
    public boolean removeFeed(Integer id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try {
            Feed feed = session.get(Feed.class, id);
            if (feed != null){
                session.delete(feed);
                return true;
            }
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    @Transactional
    public boolean addLike(Integer id, Integer uid) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try {
            Feed feed = session.get(Feed.class, id);
            if (feed != null){
                feed.getLikes().add(session.get(User.class, uid));
                session.saveOrUpdate(feed);
                return true;
            }
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    @Transactional
    public boolean removeLike(Integer id, Integer uid) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try {
            Feed feed = session.get(Feed.class, id);
            if (feed != null){
                feed.removeLike(uid);
                session.saveOrUpdate(feed);
                return true;
            }
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }
}
