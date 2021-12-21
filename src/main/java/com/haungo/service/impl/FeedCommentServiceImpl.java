package com.haungo.service.impl;

import com.haungo.pojos.FeedComment;
import com.haungo.repository.FeedCommentRepository;
import com.haungo.service.FeedCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FeedCommentServiceImpl implements FeedCommentService {
    @Autowired private FeedCommentRepository feedCommentRepository;

    @Override
    public FeedComment getFeedCommentById(Integer id) {
        return this.feedCommentRepository.getFeedCommentById(id);
    }
}
