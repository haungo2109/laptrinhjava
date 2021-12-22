package com.haungo.repository.impl;

import com.haungo.pojos.*;
import com.haungo.repository.AuctionRepository;
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
import java.util.Date;
import java.util.List;
import java.util.Map;


@Repository
public class AuctionRepositoryImpl implements AuctionRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    @Transactional
    public List<Auction> getAuctions(Map<String, String> params) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Auction> query = builder.createQuery(Auction.class);
        Root root = query.from(Auction.class);
        query = query.select(root);

        String kw = params.getOrDefault("kw", null);
        String category = params.getOrDefault("category", null);
        String minPrice = params.getOrDefault("minPrice", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));

        if (kw != null) {
            Predicate p = builder.like(root.get("title").as(String.class), String.format("%%%s%%", kw));
            query = query.where(p);
        }
        if (category != null) {
            Predicate p = builder.like(root.get("category").as(String.class), String.format("%s", category));
            query = query.where(p);
        }

        query = query.orderBy(builder.desc(root.get("createAt")));

        Query q = session.createQuery(query);

        int max = 9;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);

        return q.getResultList();
    }

    @Override
    @Transactional
    public Auction getAuctionById(Integer id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        return session.get(Auction.class, id);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Auction addAuction(Auction auction) {
        auction.setCreateAt(new Date());
        auction.setDateSuccess(null);
        auction.setAcceptPrice(null);
        auction.setBuyler(null);
        auction.setRating(null);
        auction.setCountComment(0);
        auction.setActive(true);
        auction.setCurrentPrice(auction.getBasePrice());
        auction.setStatusAuction(StatusAuction.being.toString());
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Category category = session.get(Category.class, Integer.parseInt(auction.getCategoryId()));
        if (category == null) return null;
        auction.setCategory(category);

        try {
            session.save(auction);
            if (auction.getImages() != null && !auction.getImages().isEmpty()){
                for (AuctionImage auctionImage: auction.getImages()){
                    auctionImage.setAuction(auction);
                    session.save(auctionImage);
                }
            }
            return auction;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }

        return null;
    }

    @Override
    @Transactional
    public List<Auction> getMyAuction(Integer uid) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Auction A WHERE A.user.id =:uid ");
        q.setParameter("uid", uid);

        List<Auction> auctions = q.getResultList();
        return auctions;
    }

    @Override
    @Transactional
    public List<Auction> getAuctionJoin(Integer uid) {
        return null;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean setBuyler(Integer uid, Integer auctionId) {
        Session session = sessionFactory.getObject().getCurrentSession();

        try {
            Auction auction = session.get(Auction.class, auctionId);
            User user = session.get(User.class, uid);
//            Query q = session.createQuery("FROM AuctionComment A WHERE A.auction.id =:id and A.user.id =:uid ");
//            q.setParameter("id", auctionId);
//            q.setParameter("uid", uid);
//
//            AuctionComment auctionComment = (AuctionComment) q.getResultList().get(0);

            if (auction == null || user == null) return false;
            auction.setBuyler(user);
            auction.setStatusAuction(StatusAuction.inprocess.toString());
            auction.getComments();
            AuctionComment auctionComment = auction.getCommentByUserId(uid);
            auctionComment.setStatusTransaction(StatusTransaction.inprocess.toString());

            session.update(auction);
            session.saveOrUpdate(auctionComment);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    @Transactional
    public boolean setFailer(Integer uid, Integer auctionId) {
        return false;
    }

    @Override
    @Transactional
    public boolean cancelAuction(Integer auctionId) {
        return false;
    }
}
