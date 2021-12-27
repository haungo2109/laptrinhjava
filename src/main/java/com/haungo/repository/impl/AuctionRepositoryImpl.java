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
import javax.persistence.criteria.*;
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
        String categoryId = params.getOrDefault("id", null);
        String sort = params.getOrDefault("sort", "createAt");
        int page = Integer.parseInt(params.getOrDefault("page", "1"));

        if (kw != null) {
            Predicate p = builder.like(root.get("title").as(String.class), String.format("%%%s%%", kw));
            query = query.where(p);
        }
        if (categoryId != null) {
            Predicate p = builder.equal(root.get("category").get("id").as(Integer.class), Integer.parseInt(categoryId));
            query = query.where(p);
        }
        Predicate filterActive = builder.equal(root.get("active").as(Boolean.class), true);
        Predicate filterBeing = builder.equal(root.get("statusAuction").as(String.class), StatusAuction.being.toString());

        query = query.where(filterActive, filterBeing).orderBy(builder.desc(root.get(sort)));

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
        Auction auction = session.get(Auction.class, id);
        if (auction != null && auction.getDeadline().before(new Date()) && auction.getStatusAuction().equals(StatusAuction.being.toString())){
            Query q = session.createQuery("UPDATE Auction A Set A.statusAuction=:status WHERE A.id=:id");
            q.setParameter("status", StatusAuction.fail.toString());
            q.setParameter("id", id);
            q.executeUpdate();
        }
        return auction;
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
        auction.setCategory(new Category(Integer.parseInt(auction.getCategoryId())));
        Session session = this.sessionFactory.getObject().getCurrentSession();

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
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Auction> query = builder.createQuery(Auction.class);

        Root root = query.from(Auction.class);

        Subquery<AuctionComment> subquery = query.subquery(AuctionComment.class);
        Root<AuctionComment> subRootEntity = subquery.from(AuctionComment.class);

        Predicate predicate = builder.equal(subRootEntity.get("user").get("id").as(Integer.class), uid);
        Predicate predicate1 = builder.equal(root.get("id"), subRootEntity.get("auction").get("id"));

        subquery.select(subRootEntity).where(predicate, predicate1);
        query = query.select(root).where(builder.exists(subquery));

        List<Auction> auctions = session.createQuery(query).getResultList();
        return auctions;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean setBuyler(Integer commentId, Integer auctionId) {
        Session session = sessionFactory.getObject().getCurrentSession();

        AuctionComment auctionComment = session.get(AuctionComment.class, commentId);
        Auction auction = session.get(Auction.class, auctionId);
        try {
            auction.setBuyler(auctionComment.getUser());
            auction.setStatusAuction(StatusAuction.inprocess.toString());
            auction.setAcceptPrice(auctionComment.getPrice());
            session.update(auction);
            Query auctionCommentQuery = session.createQuery("UPDATE AuctionComment A SET A.statusTransaction=:status WHERE A.id =:id ");

            auctionCommentQuery.setParameter("status", StatusTransaction.inprocess.toString());
            auctionCommentQuery.setParameter("id", commentId);

            if (auctionCommentQuery.executeUpdate() == 1)
                return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    @Transactional
    public boolean setFailer(Integer commentId, Integer auctionId) {
        return false;
    }

    @Override
    @Transactional
    public boolean cancelAuction(Integer auctionId) {
        return false;
    }
}
