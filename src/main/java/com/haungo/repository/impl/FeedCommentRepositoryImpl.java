package com.haungo.repository.impl;

import com.haungo.pojos.Category;
import com.haungo.pojos.FeedComment;
import com.haungo.repository.FeedCommentRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class FeedCommentRepositoryImpl implements FeedCommentRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public FeedComment getFeedCommentById(Integer id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        return session.get(FeedComment.class, id);
    }
}
