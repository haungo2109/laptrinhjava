package com.haungo.controllers;

import com.haungo.service.AuctionService;
import com.haungo.service.FeedService;
import com.haungo.service.ReportService;
import com.haungo.service.StatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {
    @Autowired private StatsService statsService;
    @Autowired private ReportService reportService;
    @Autowired private AuctionService auctionService;
    @Autowired private FeedService feedService;

    @RequestMapping(value = {"/admin"}, method = RequestMethod.GET)
    public String adminPage(Model model, HttpSession session) {
        List<Long> longList = this.statsService.overviewStats(null, null);
        model.addAttribute("countAuction", longList.get(0));
        model.addAttribute("countFeed", longList.get(1));
        model.addAttribute("countReport", longList.get(2));
        model.addAttribute("reports", this.reportService.getReports());
        return "admin";
    }

    @RequestMapping(value = {"/admin/report-post"}, method = RequestMethod.GET)
    public String reportPost(Model model, HttpSession session) {
        model.addAttribute("feedStats", this.statsService.postStats(null, null, null));
        return "reportPost";
    }

    @RequestMapping(value = {"/admin/report-auction"}, method = RequestMethod.GET)
    public String reportAuction(Model model, HttpSession session, @RequestParam Map<String, String> params) {
        try {
            Date toDate = new SimpleDateFormat("yyyy-MM-dd").parse(params.getOrDefault("toDate", "2021-12-31"));
            Date fromDate = new SimpleDateFormat("yyyy-MM-dd").parse(params.getOrDefault("fromDate", "2021-01-01"));
            String cateId = params.getOrDefault("category", null);
            if (cateId != null)
                model.addAttribute("auctionStats", this.statsService.auctionStats(Integer.parseInt(cateId),fromDate, toDate));
            else
                model.addAttribute("auctionStats", this.statsService.auctionStats(null,fromDate, toDate));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        model.addAttribute("statusAuction", this.statsService.statusAuction());
        model.addAttribute("categoryStats", this.statsService.categoryStats());
        return "reportAuction";
    }
}
