package com.haungo.service;

import com.haungo.pojos.Auction;
import com.haungo.pojos.AuctionComment;

import java.util.List;
import java.util.Map;

public interface AuctionService {
    List<Auction> getAuctions(Map<String, String> params);
    Auction getAuctionById(Integer id);
    Auction addAuction(Auction auction);
    List<Auction> getMyAuction(Integer uid);
    List<Auction> getAuctionJoin(Integer uid);
    boolean setBuyler(Integer uid, Integer auctionId);
    boolean setFailer(Integer uid, Integer auctionId);
    boolean cancelAuction(Integer auctionId);
}
