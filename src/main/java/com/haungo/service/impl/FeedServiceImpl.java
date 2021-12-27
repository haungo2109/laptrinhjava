package com.haungo.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.haungo.pojos.*;
import com.haungo.repository.FeedRepository;
import com.haungo.service.FeedService;
import com.haungo.service.NotificationService;
import com.haungo.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

@Service
public class FeedServiceImpl implements FeedService {

    @Autowired private FeedRepository feedRepository;
    @Autowired private Cloudinary cloudinary;
    @Autowired private NotificationService notificationService;

    @Override
    public List<Feed> getFeeds(Map<String, String> params) {
        return this.feedRepository.getFeeds(params);
    }

    @Override
    public Feed getFeedById(Integer id) {
        return this.feedRepository.getFeedById(id);
    }

    @Override
    public Feed addFeed(Feed feed) {
        List<MultipartFile> files = feed.getFiles();

        if (null != files && files.size() > 0) { //Add image to auction
            Map params = ObjectUtils.asMap(
                    "folder", "assets/feed",
                    "overwrite", true,
                    "resource_type", "auto"
            );
            Set<FeedImage> feedImages = new HashSet<>();
            for (MultipartFile multipartFile : files) {
                if (multipartFile.getSize()==0) continue;
                try {
                    Map r = this.cloudinary.uploader().upload(multipartFile.getBytes(), params);
                    String imageUrl = (String) r.get("secure_url");
                    feedImages.add(new FeedImage(imageUrl));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            feed.setImages(feedImages);
        }
        if (!feed.getContent().isEmpty()) {
            Set<Hashtag> hashtags = new HashSet<>();
            for (String hashtag : Utils.getHashtag(feed.getContent())) {
                hashtags.add(new Hashtag(hashtag));
            }
            feed.setHashtags(hashtags);
        }
        return this.feedRepository.addFeed(feed);
    }

    @Override
    public Feed updateFeed(Feed feed) {
        if (null != feed.getFiles() && feed.getFiles().size() > 0) { //Add image to auction
            Map params = ObjectUtils.asMap(
                    "folder", "assets/feed",
                    "overwrite", true,
                    "resource_type", "auto"
            );
            Set<FeedImage> feedImages = new HashSet<>();
            for (MultipartFile multipartFile : feed.getFiles()) {
                if (multipartFile.getSize()==0) continue;
                try {
                    Map r = this.cloudinary.uploader().upload(multipartFile.getBytes(), params);
                    String imageUrl = (String) r.get("secure_url");
                    feedImages.add(new FeedImage(imageUrl));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            feed.setImages(feedImages);
        }
        if (!feed.getContent().isEmpty()) {
            Set<Hashtag> hashtags = new HashSet<>();
            for (String hashtag : Utils.getHashtag(feed.getContent())) {
                hashtags.add(new Hashtag(hashtag));
            }
            feed.setHashtags(hashtags);
        }
        return this.feedRepository.updateFeed(feed);
    }

    @Override
    public boolean removeFeed(Integer id) {
        return this.feedRepository.removeFeed(id);
    }

    @Override
    public boolean addLike(User user, Integer id, Integer uid) {
        if (this.feedRepository.addLike(id, uid) == false) {
            return false;
        }
        Feed feed = this.feedRepository.getFeedById(id);
        if (feed.getUser().getId() != user.getId()){
            String content = Notification.genContent(user, "thích bài viết ") + feed.getContent();
            Notification notification = new Notification(Notification.LikeMess, content, feed.getUser());
            this.notificationService.addNotification(notification);
        }

        return true;
    }

    @Override
    public boolean removeLike(Integer id, Integer uid) {
        return this.feedRepository.removeLike(id, uid);
    }
}
