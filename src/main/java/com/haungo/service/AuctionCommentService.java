package com.haungo.service;

import com.haungo.pojos.AuctionComment;

import java.util.List;

public interface AuctionCommentService {
    List<AuctionComment> getMyAuctionCommentByAuctionId(Integer auctionId, Integer uid);
    AuctionComment addAuctionComment(AuctionComment auctionComment);
    List<AuctionComment> getCommentByAuctionId(Integer id);
}
