package com.haungo.repository.impl;

import com.haungo.pojos.Report;
import com.haungo.repository.ReportRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Repository
@Transactional
public class ReportRepositoryImpl implements ReportRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Report> getReports() {
        Session session = sessionFactory.getObject().getCurrentSession();
        List<Report> reports = session.createQuery("FROM Report").getResultList();
        return reports;
    }

    @Override
    public boolean addReport(Report report) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        report.setCreateAt(new Date());
        try {
            session.save(report);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }
}
