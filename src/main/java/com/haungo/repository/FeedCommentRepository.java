package com.haungo.repository;

import com.haungo.pojos.FeedComment;

import java.util.List;

public interface FeedCommentRepository {
    FeedComment getFeedCommentById(Integer id);
    FeedComment addFeedComment(FeedComment feedComment);
    List<FeedComment> getFeedCommentByFeedId(Integer id);
    boolean removeComment(Integer id);
}
