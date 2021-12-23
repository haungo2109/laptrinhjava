package com.haungo.service.impl;

import com.haungo.pojos.FeedComment;
import com.haungo.repository.FeedCommentRepository;
import com.haungo.service.FeedCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedCommentServiceImpl implements FeedCommentService {
    @Autowired private FeedCommentRepository feedCommentRepository;

    @Override
    public FeedComment getFeedCommentById(Integer id) {
        return this.feedCommentRepository.getFeedCommentById(id);
    }

    @Override
    public FeedComment addFeedComment(FeedComment feedComment) {
        return this.feedCommentRepository.addFeedComment(feedComment);
    }

    @Override
    public List<FeedComment> getFeedCommentByFeedId(Integer id) {
        return this.feedCommentRepository.getFeedCommentByFeedId(id);
    }

    @Override
    public boolean removeComment(Integer id) {
        return this.feedCommentRepository.removeComment(id);
    }
}
