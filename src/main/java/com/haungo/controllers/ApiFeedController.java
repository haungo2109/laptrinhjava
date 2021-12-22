package com.haungo.controllers;

import com.haungo.pojos.Feed;
import com.haungo.pojos.FeedComment;
import com.haungo.pojos.User;
import com.haungo.service.FeedCommentService;
import com.haungo.service.FeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.parser.Entity;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@RestController
public class ApiFeedController {
    @Autowired private FeedService feedService;
    @Autowired private FeedCommentService feedCommentService;

    @PostMapping(value = "/api/like-feed", produces = MediaType.APPLICATION_JSON_VALUE)
    public HttpStatus likeFeed(@RequestBody Map<String, String> params, HttpSession session) {
        Integer id = Integer.parseInt(params.getOrDefault("feedId", null));
        User user = (User) session.getAttribute("currentUser");
        if (id != null && this.feedService.addLike(id, user.getId()))
            return HttpStatus.OK;
        else
            return HttpStatus.BAD_REQUEST;
    }

    @PostMapping(value = "/api/dislike-feed", produces = MediaType.APPLICATION_JSON_VALUE)
    public HttpStatus dislikeFeed(@RequestBody Map<String, String> params, HttpSession session) {
        Integer id = Integer.parseInt(params.getOrDefault("feedId", null));
        User user = (User) session.getAttribute("currentUser");
        if (id != null && this.feedService.removeLike(id, user.getId()))
            return HttpStatus.OK;
        else
            return HttpStatus.BAD_REQUEST;
    }

    @PostMapping(value = "/add-comment", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<FeedComment> createFeedComment(@RequestBody Map params, HttpSession session) {
        return null;
    }

    @PostMapping(value = "/api/update-feed", produces = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Feed> updateFeed(@RequestBody Feed feed, HttpSession session) {
        if (feed.isCanUpdate() == false) return new ResponseEntity(feed, HttpStatus.BAD_REQUEST);
        Feed rs = this.feedService.updateFeed(feed);
        return new ResponseEntity<>(rs, HttpStatus.OK);
    }

    @DeleteMapping(value = "/remove-comment", produces = MediaType.APPLICATION_JSON_VALUE)
    public HttpStatus deleteFeedComment(@RequestBody Map<String, String> params, HttpSession session) {
        Integer id = Integer.parseInt(params.getOrDefault("commentId", null));
        User user = (User) session.getAttribute("currentUser");

        //check resource owner
        if (this.feedCommentService.getFeedCommentById(id).getUser().getId() != user.getId()) return HttpStatus.BAD_REQUEST;

        if (id != null && this.feedService.removeComment(id))
            return HttpStatus.OK;
        else
            return HttpStatus.BAD_REQUEST;
    }
    @DeleteMapping(value = "/api/remove-feed", produces = MediaType.APPLICATION_JSON_VALUE)
    public HttpStatus deleteFeed(@RequestBody Map<String, String> params, HttpSession session) {
        Integer id = Integer.parseInt(params.getOrDefault("feedId", null));
        User user = (User) session.getAttribute("currentUser");

        //check resource owner
        if (this.feedService.getFeedById(id).getUser().getId() != user.getId()) return HttpStatus.BAD_REQUEST;

        if (id != null && this.feedService.removeFeed(id))
            return HttpStatus.OK;
        else
            return HttpStatus.BAD_REQUEST;
    }

}
