/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.haungo.controllers;

import com.haungo.pojos.Auction;
import com.haungo.pojos.Feed;
import com.haungo.pojos.User;
import com.haungo.service.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author kan_haungo
 */
@Controller
@ControllerAdvice
public class HomeController {
    @Autowired private CategoryService categoryService;
    @Autowired private PaymentService paymentService;
    @Autowired private FeedService feedService;
    @Autowired private AuctionService auctionService;

    @ModelAttribute
    public void commonAttrs(Model model, HttpSession session) {
        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("payments", this.paymentService.getPayments());
    }

    @RequestMapping(value = {"/", "/login", "/register", "/create-auction", "/create-feed"}, method = RequestMethod.GET)
    public String index(Model model, @RequestParam Map<String, String> params, HttpSession session) {
        //Check login send feed, auction for create, and current user

        List<Feed> feeds = this.feedService.getFeeds(params);
        List<Auction> auctions = this.auctionService.getAuctions(params);

        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser != null){
            model.addAttribute("auction", new Auction());
            model.addAttribute("feed", new Feed());
            model.addAttribute("currentUser", currentUser);
            for (Feed feed: feeds){
                feed.checkIsLike(currentUser.getId());
            }
        } else if (model.getAttribute("user") == null) {
            //If not login send user to form login and register
            model.addAttribute("user", new User());
        }
        model.addAttribute("feeds", feeds);
        model.addAttribute("auctions", auctions);
        return "index";
    }
}
