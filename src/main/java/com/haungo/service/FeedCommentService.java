package com.haungo.service;

import com.haungo.pojos.FeedComment;
import com.haungo.pojos.User;

import java.util.List;

public interface FeedCommentService {
    FeedComment getFeedCommentById(Integer id);
    FeedComment addFeedComment(FeedComment feedComment);
    List<FeedComment> getFeedCommentByFeedId(Integer id);
    boolean removeComment(Integer id);
}
