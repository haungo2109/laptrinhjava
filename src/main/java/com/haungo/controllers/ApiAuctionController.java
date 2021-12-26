package com.haungo.controllers;

import com.haungo.pojos.*;
import com.haungo.service.AuctionCommentService;
import com.haungo.service.AuctionService;
import com.haungo.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;

@RestController
public class ApiAuctionController {
    @Autowired private AuctionService auctionService;
    @Autowired private NotificationService notificationService;
    @Autowired private AuctionCommentService auctionCommentService;

    @PostMapping(value = "/api/set-winner/{uid}/{auctionId}", produces = MediaType.APPLICATION_JSON_VALUE)
    public HttpStatus setWinner(@PathVariable Integer commentId, @PathVariable Integer auctionId, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");

        Auction auction = this.auctionService.getAuctionById(auctionId);
        if (auction == null || !auction.getUser().getId().equals(user.getId()) || !auction.getStatusAuction().equals(StatusAuction.being.toString()))
            return HttpStatus.BAD_REQUEST;
        if (!this.auctionService.setBuyler(commentId, auctionId)) return HttpStatus.BAD_REQUEST;

        return  HttpStatus.OK;
    }

}
