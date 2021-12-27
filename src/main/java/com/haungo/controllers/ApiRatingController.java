package com.haungo.controllers;

import com.haungo.pojos.Rating;
import com.haungo.pojos.User;
import com.haungo.service.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class ApiRatingController {
    @Autowired
    RatingService ratingService;

    @PostMapping(value = "/api/add-rating/{auctionId}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Rating> addRating(@RequestBody Rating rating, HttpSession session){
        User user = (User) session.getAttribute("currentUser");
        rating.setUser(user);
        Rating rating1 = this.ratingService.addRating(rating);
        if (rating1 == null){
            return new ResponseEntity<>(rating, HttpStatus.BAD_REQUEST);
        }
        return  new ResponseEntity<>(rating1, HttpStatus.OK);
    }
}
