package com.haungo.repository;

import com.haungo.pojos.FeedImage;

import java.util.List;

public interface FeedImageRepository {
    List<FeedImage> getImageByFeedId(Integer feedId);
    boolean addFeedImage(FeedImage feedImage);
    boolean deleteImageByFeedId(Integer id);
}
