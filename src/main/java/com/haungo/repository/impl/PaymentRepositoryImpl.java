package com.haungo.repository.impl;

import com.haungo.pojos.Category;
import com.haungo.pojos.Payment;
import com.haungo.repository.PaymentRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class PaymentRepositoryImpl implements PaymentRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public List<Payment> getPayments() {
        Session session = sessionFactory.getObject().getCurrentSession();
        List<Payment> payments = session.createQuery("FROM Payment").getResultList();
        return payments;
    }

    @Override
    public Payment getPaymentById(int payId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        return session.get(Payment.class, payId);
    }

    @Override
    public boolean addPayment(Payment payment) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(payment);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }

        return false;
    }
}
