package com.haungo.repository.impl;

import com.haungo.pojos.*;
import com.haungo.repository.AuctionCommentRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.Date;
import java.util.List;

@Repository
@Transactional
public class AuctionCommentRepositoryImpl implements AuctionCommentRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<AuctionComment> getMyAuctionCommentByAuctionId(Integer auctionId, Integer uid) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM AuctionComment A WHERE A.auction.id =:id and A.user.id =:uid ORDER BY A.createAt DESC");
        q.setParameter("id", auctionId);
        q.setParameter("uid", uid);
        List<AuctionComment> auctionComments = q.getResultList();

        return auctionComments;
    }

    @Override
    public AuctionComment addAuctionComment(AuctionComment auctionComment) {
        Session session = sessionFactory.getObject().getCurrentSession();
        auctionComment.setStatusTransaction(StatusTransaction.none.toString());
        auctionComment.setCreateAt(new Date());

        Auction auction = session.get(Auction.class, auctionComment.getAuctionId());
        User user = session.get(User.class, auctionComment.getUserId());
        if (auction.getCurrentPrice().compareTo(auctionComment.getPrice()) >= 0 || user == null){
            return null;
        }

        try {
            Query q = session.createQuery("UPDATE Auction A SET A.countComment=:count, A.currentPrice=:price WHERE A.id=:id");
            q.setParameter("count", auction.getCountComment() + 1);
            q.setParameter("price", auctionComment.getPrice());
            q.setParameter("id", auction.getId());
            if (q.executeUpdate() != 1) return null;

            auctionComment.setAuction(auction);
            auctionComment.setUser(user);
            session.save(auctionComment);
            return auctionComment;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }

        return null;
    }

    @Override
    public List<AuctionComment> getCommentByAuctionId(Integer id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM AuctionComment A WHERE A.auction.id =:id");
        q.setParameter("id", id);
        List<AuctionComment> auctionComments = q.getResultList();

        return auctionComments;
    }
}
