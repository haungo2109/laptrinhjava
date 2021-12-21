/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.haungo.repository;

import com.haungo.pojos.Feed;
import com.haungo.pojos.FeedComment;

import java.util.List;
import java.util.Map;

/**
 *
 * @author kan_haungo
 */
public interface FeedRepository {
    List<Feed> getFeeds(Map<String, String> params);
    Feed getFeedById(Integer id);
    Feed addFeed(Feed feed);
    Feed updateFeed(Feed feed);
    boolean removeFeed(Integer id);
    boolean addLike(Integer id, Integer uid);
    boolean removeLike(Integer id, Integer uid);
    FeedComment addComment(Integer id, Integer uid, FeedComment feedComment);
    boolean removeComment(Integer id);
}
