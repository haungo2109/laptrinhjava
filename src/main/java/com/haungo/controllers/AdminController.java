package com.haungo.controllers;

import com.haungo.pojos.Auction;
import com.haungo.pojos.User;
import com.haungo.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {
    @Autowired private AuctionService auctionService;

    @RequestMapping(value = {"/admin"}, method = RequestMethod.GET)
    public String auctionJoin(Model model, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        if (user == null) return "auctionJoin";
        List<Auction> auctions = this.auctionService.getAuctionJoin(user.getId());
        model.addAttribute("auctions", auctions);
        return "auctionJoin";
    }
}
