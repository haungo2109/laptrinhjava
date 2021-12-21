package com.haungo.service.impl;

import com.haungo.pojos.FeedImage;
import com.haungo.repository.FeedImageRepository;
import com.haungo.service.FeedImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedImageServiceImpl implements FeedImageService {
    @Autowired private FeedImageRepository feedImageRepository;

    @Override
    public List<FeedImage> getImageByFeedId(Integer feedId) {
        return this.feedImageRepository.getImageByFeedId(feedId);
    }

    @Override
    public boolean addFeedImage(FeedImage feedImage) {
        return this.feedImageRepository.addFeedImage(feedImage);
    }
}
