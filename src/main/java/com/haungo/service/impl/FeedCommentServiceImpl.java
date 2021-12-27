package com.haungo.service.impl;

import com.haungo.pojos.Feed;
import com.haungo.pojos.FeedComment;
import com.haungo.pojos.Notification;
import com.haungo.pojos.User;
import com.haungo.repository.FeedCommentRepository;
import com.haungo.service.FeedCommentService;
import com.haungo.service.FeedService;
import com.haungo.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedCommentServiceImpl implements FeedCommentService {
    @Autowired private FeedCommentRepository feedCommentRepository;
    @Autowired private NotificationService notificationService;
    @Autowired private FeedService feedService;

    @Override
    public FeedComment getFeedCommentById(Integer id) {
        return this.feedCommentRepository.getFeedCommentById(id);
    }

    @Override
    public FeedComment addFeedComment(FeedComment feedComment) {
        FeedComment feedComment1 = this.feedCommentRepository.addFeedComment(feedComment);

        if (feedComment1 != null){
            if (!feedComment.getUser().getId().equals(feedComment.getFeed().getUser().getId())) {
                String content = Notification.genContent(feedComment.getUser(), "đã bình luận ") + feedComment1.getContent();
                Notification notification = new Notification(Notification.CommentFeedMess, content, feedComment.getFeed().getUser());
                this.notificationService.addNotification(notification);
            }
            return feedComment1;
        }
        return null;
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
