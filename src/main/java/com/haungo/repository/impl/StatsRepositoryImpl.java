package com.haungo.repository.impl;

import com.haungo.pojos.Auction;
import com.haungo.pojos.Category;
import com.haungo.pojos.Feed;
import com.haungo.pojos.Report;
import com.haungo.repository.StatsRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Transient;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
@Transactional
public class StatsRepositoryImpl implements StatsRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> categoryStats() {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootA = q.from(Auction.class);
        Root rootC = q.from(Category.class);

        q.where(b.equal(rootA.get("category"), rootC.get("id")));
        q.multiselect(rootC.get("id"), rootC.get("name"), b.count(rootA.get("id")));
        q.groupBy(rootC.get("id"));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Object[]> statusAuction() {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT A.statusAuction, COUNT(*) FROM Auction A GROUP BY statusAuction ORDER BY COUNT(*)");
        return q.getResultList();
    }

    @Override
    public List<Object[]> postStats(String kw, Date fromDate, Date toDate) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT MONTH(createAt), COUNT(*) FROM Feed A GROUP BY MONTH(createAt) ORDER BY MONTH(createAt)");
        return q.getResultList();
    }

    @Override
    public List<Object[]> auctionStats(Integer categoryId, Date fromDate, Date toDate) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = null;
        if (categoryId != null) {
            q = session.createQuery("SELECT MONTH(createAt), COUNT(*), SUM(A.currentPrice), SUM(A.basePrice) FROM Auction A WHERE A.createAt BETWEEN :fromDate AND :toDate and A.category.id=:id GROUP BY MONTH(createAt) ORDER BY MONTH(createAt)");
            q.setParameter("id", categoryId);
        } else {
            q = session.createQuery("SELECT MONTH(createAt), COUNT(*), SUM(A.currentPrice), SUM(A.basePrice) FROM Auction A WHERE A.createAt BETWEEN :fromDate AND :toDate GROUP BY MONTH(createAt) ORDER BY MONTH(createAt)");
        }
        q.setParameter("fromDate", fromDate);
        q.setParameter("toDate", toDate);
        return q.getResultList();
    }

    @Override
    public List<Long> overviewStats(Date fromDate, Date toDate) {
        Session session = sessionFactory.getObject().getCurrentSession();

        Query q = session.createQuery("SELECT Count(*) FROM Auction");
        Query q1 = session.createQuery("SELECT Count(*) FROM Feed");
        Query q2 = session.createQuery("SELECT Count(*) FROM Report");
        Long countAuction = (Long) q.getSingleResult();
        Long countFeed = (Long) q1.getSingleResult();
        Long countReport = (Long) q2.getSingleResult();

        List<Long> longs = new ArrayList(){{
            add(countAuction);
            add(countFeed);
            add(countReport);
        }};
        return longs;
    }
}
