package com.haungo.service;

import com.haungo.pojos.FeedImage;

import java.util.List;

public interface FeedImageService {
    List<FeedImage> getImageByFeedId(Integer feedId);
    boolean addFeedImage(FeedImage feedImage);
}
