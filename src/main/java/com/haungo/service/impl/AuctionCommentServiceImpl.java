package com.haungo.service.impl;

import com.haungo.pojos.AuctionComment;
import com.haungo.repository.AuctionCommentRepository;
import com.haungo.service.AuctionCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuctionCommentServiceImpl implements AuctionCommentService {
    @Autowired private AuctionCommentRepository auctionCommentRepository;

    @Override
    public List<AuctionComment> getMyAuctionCommentByAuctionId(Integer auctionId, Integer uid) {
        return this.auctionCommentRepository.getMyAuctionCommentByAuctionId(auctionId, uid);
    }

    @Override
    public AuctionComment addAuctionComment(AuctionComment auctionComment) {
        return this.auctionCommentRepository.addAuctionComment(auctionComment);
    }

    @Override
    public List<AuctionComment> getCommentByAuctionId(Integer id) {
        return this.auctionCommentRepository.getCommentByAuctionId(id);
    }
}
