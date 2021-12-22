/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.haungo.repository;

import com.haungo.pojos.Auction;
import com.haungo.pojos.AuctionComment;

import java.util.List;
import java.util.Map;

/**
 *
 * @author kan_haungo
 */
public interface AuctionRepository {
    List<Auction> getAuctions(Map<String, String> params);
    Auction getAuctionById(Integer id);
    Auction addAuction(Auction auction);
    List<Auction> getMyAuction(Integer uid);
    List<Auction> getAuctionJoin(Integer uid);
    boolean setBuyler(Integer uid, Integer auctionId);
    boolean setFailer(Integer uid, Integer auctionId);
    boolean cancelAuction(Integer auctionId);
}
