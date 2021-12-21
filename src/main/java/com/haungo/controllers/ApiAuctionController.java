package com.haungo.controllers;

import com.haungo.pojos.Auction;
import com.haungo.pojos.Feed;
import com.haungo.pojos.User;
import com.haungo.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@RestController
public class ApiAuctionController {
    @Autowired private AuctionService auctionService;


}
