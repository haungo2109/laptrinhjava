package com.haungo.repository.impl;

import com.haungo.pojos.Category;
import com.haungo.repository.CategoryRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CategoryRepositoryImpl implements CategoryRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Category> getCategories() {
        Session session = sessionFactory.getObject().getCurrentSession();
        List<Category> categories = session.createQuery("FROM Category").getResultList();
        return categories;
    }

    @Override
    public Category getCategoryById(int cateId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        return session.get(Category.class, cateId);
    }

    @Override
    public boolean addCategory(Category category) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(category);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }
}
