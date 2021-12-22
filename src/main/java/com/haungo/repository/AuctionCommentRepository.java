package com.haungo.repository;

import com.haungo.pojos.AuctionComment;

import java.util.List;

public interface AuctionCommentRepository {
    List<AuctionComment> getMyAuctionCommentByAuctionId(Integer auctionId, Integer uid);
    AuctionComment addAuctionComment(AuctionComment auctionComment);
    List<AuctionComment> getCommentByAuctionId(Integer id);

}
