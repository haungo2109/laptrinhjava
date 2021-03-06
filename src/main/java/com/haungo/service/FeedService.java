package com.haungo.service;

import com.haungo.pojos.Feed;
import com.haungo.pojos.FeedComment;
import com.haungo.pojos.User;

import java.util.List;
import java.util.Map;

public interface FeedService {
    List<Feed> getFeeds(Map<String, String> params);
    Feed getFeedById(Integer id);
    Feed addFeed(Feed feed);
    Feed updateFeed(Feed feed);
    boolean removeFeed(Integer id);
    boolean addLike(User user, Integer id, Integer uid);
    boolean removeLike(Integer id, Integer uid);
}
