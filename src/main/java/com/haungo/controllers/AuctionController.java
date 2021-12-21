/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.haungo.controllers;

import com.haungo.pojos.Auction;
import com.haungo.pojos.Category;
import com.haungo.pojos.Feed;
import com.haungo.pojos.User;
import com.haungo.service.AuctionService;
import com.haungo.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 *
 * @author kan_haungo
 */
@Controller
public class AuctionController {
    @Autowired private AuctionService auctionService;
    @Autowired private CategoryService categoryService;

    @PostMapping(value = "/create-auction")
    public String createAuction(@ModelAttribute Auction auction, Model model, HttpSession session, BindingResult result) {
        if (result.hasErrors()){
            return "index";
        }
        Date date1 = null;
        try {
            date1 = new SimpleDateFormat("yyyy-MM-dd").parse(auction.getDate());
            auction.setDeadline(date1);
            auction.setUser((User) session.getAttribute("currentUser"));
            Auction rs = this.auctionService.addAuction(auction);
            if (rs == null){
                model.addAttribute("messageErrorCreateAuction", "Đã có lỗi xảy ra vui lòng thử lại");
                return "index";
            }
        } catch (ParseException e) {
            e.printStackTrace();
            model.addAttribute("messageErrorCreateAuction", "Đã có lỗi xảy ra vui lòng thử lại");
        }
        return "redirect:/";
    }

    @RequestMapping(value = {"/category"}, method = RequestMethod.GET)
    public String index(Model model, @RequestParam Map<String, String> params, HttpSession session) {
        //Check login send feed, auction for create, and current user
        String type = params.getOrDefault("category", "Tất cả");
        List<Auction> auctions = this.auctionService.getAuctions(params);
        List<Category> categories = this.categoryService.getCategories();

        model.addAttribute("typeCategory", type);
        model.addAttribute("auctions", auctions);
        model.addAttribute("categories", categories);

        return "category";
    }

    @RequestMapping(value = {"/auction/{id}"}, method = RequestMethod.GET)
    public String auctionDetail(Model model,@PathVariable String id, HttpSession session) {
        //Check login send feed, auction for create, and current user
        Auction auction = this.auctionService.getAuctionById(Integer.parseInt(id));

        model.addAttribute("auction", auction);
        return "auctionDetail";
    }
}
