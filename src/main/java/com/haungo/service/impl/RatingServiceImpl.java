package com.haungo.service.impl;

import com.haungo.pojos.Rating;
import com.haungo.service.RatingRepository;
import com.haungo.service.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RatingServiceImpl implements RatingService {
    @Autowired private RatingRepository ratingRepository;
    @Override
    public List<Rating> getRatingByUserId(Integer uid) {
        return this.ratingRepository.getRatingByUserId(uid);
    }

    @Override
    public List<Rating> getRatingByAuctionId(Integer id) {
        return this.ratingRepository.getRatingByAuctionId(id);
    }

    @Override
    public Rating addRating(Rating rating) {
        return this.ratingRepository.addRating(rating);
    }
}
