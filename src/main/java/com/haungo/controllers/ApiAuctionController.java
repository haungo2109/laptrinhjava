package com.haungo.controllers;

import com.haungo.pojos.*;
import com.haungo.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;

@RestController
public class ApiAuctionController {
    @Autowired private AuctionService auctionService;

    @PostMapping(value = "/api/set-winner/{uid}/{auctionId}", produces = MediaType.APPLICATION_JSON_VALUE)
    public HttpStatus setWinner(@PathVariable Integer uid, @PathVariable Integer auctionId, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");

        Auction auction = this.auctionService.getAuctionById(auctionId);

        if (auction == null || !auction.getUser().getId().equals(user.getId()) || !auction.getStatusAuction().equals(StatusAuction.being.toString()))
            return HttpStatus.BAD_REQUEST;

        if (!this.auctionService.setBuyler(uid, auctionId)) return HttpStatus.BAD_REQUEST;

        return  HttpStatus.OK;
    }

}
