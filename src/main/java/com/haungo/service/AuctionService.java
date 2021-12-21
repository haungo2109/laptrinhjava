package com.haungo.service;

import com.haungo.pojos.Auction;

import java.util.List;
import java.util.Map;

public interface AuctionService {
    List<Auction> getAuctions(Map<String, String> params);
    Auction getAuctionById(Integer id);
    Auction addAuction(Auction auction);
    List<Auction> getMyAuction(Integer uid);
    List<Auction> getAuctionJoin(Integer uid);
}
