package com.haungo.service;

import com.haungo.pojos.Rating;

import java.util.List;

public interface RatingRepository {
    List<Rating> getRatingByUserId(Integer uid);
    List<Rating> getRatingByAuctionId(Integer id);
    Rating addRating(Rating rating);
}
