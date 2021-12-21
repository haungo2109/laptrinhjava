package com.haungo.controllers;

import com.haungo.pojos.Feed;
import com.haungo.pojos.User;
import com.haungo.service.FeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class FeedController {
    @Autowired
    private FeedService feedService;

    @PostMapping(value = "/create-feed")
    public String createFeed(@ModelAttribute Feed feed, Model model, HttpSession session, BindingResult result) {
        if (result.hasErrors()){
            model.addAttribute("feed", feed);
            return "index";
        }

        feed.setUser((User) session.getAttribute("currentUser"));

        Feed rs = this.feedService.addFeed(feed);
        if (rs == null){
            model.addAttribute("messageErrorCreateAuction", "Đã có lỗi xảy ra vui lòng thử lại");
            return "index";
        }
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        model.addAttribute("feed", feed);
        return "redirect:/";
    }
}
