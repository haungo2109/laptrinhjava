/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.haungo.pojos;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author kan_haungo
 */
@Entity
@Table(name = "social_network_post")
public class Feed implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String content;

    @Column(name = "create_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createAt;
    private boolean active;

    @Column(name = "count_comment")
    private Integer countComment;

    @Transient
    private int countLike;
    @Transient
    private boolean isUserLike = false;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "feed", cascade = CascadeType.REMOVE)
    private Set<FeedImage> images;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "feed", cascade = CascadeType.REMOVE)
    private Set<FeedComment> comments;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "social_network_post_like",
            joinColumns = {
                @JoinColumn(name = "post_id")
            },
            inverseJoinColumns = {
                @JoinColumn(name = "user_id")
            }
    )
    private Set<User> likes;

    @JsonIgnore
    @ManyToMany(cascade = CascadeType.ALL, targetEntity = Hashtag.class)
    @JoinTable(
            name = "social_network_post_hashtag",
            joinColumns = {
                @JoinColumn(name = "post_id")
            },
            inverseJoinColumns = {
                @JoinColumn(name = "hashtagpost_id")
            }
    )
    private Set<Hashtag> hashtags;

    @Transient
    private List<MultipartFile> files;
    @Transient
    private String feedId;

    public Feed() {
    }

    public Feed(Integer id) {
        this.id = id;
    }

    public void checkIsLike(Integer uid){
        if (this.likes != null && !this.likes.isEmpty()) {
            for (User u: this.likes){
                if (u.getId().equals(uid)) {
                    this.setIsUserLike(true);
                    break;
                }
            }
        }
    }

    public void removeLike(Integer uid){
        Set<User> users = new HashSet<>();
        for (User u: this.likes){
            if (!u.getId().equals(uid)) users.add(u);
        }
        this.setLikes(users);
    }

    public boolean isCanUpdate(){
        if (this.images == null && content == null || id == null) return false;
        return true;
    }

    public Set<Hashtag> getHashtags() {
        return this.hashtags;
    }

    public void setHashtags(Set<Hashtag> hashtags) {
        this.hashtags = hashtags;
    }

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the countComment
     */
    public Integer getCountComment() {
        return countComment;
    }

    /**
     * @param countComment the countComment to set
     */
    public void setCountComment(Integer countComment) {
        this.countComment = countComment;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the createAt
     */
    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public boolean getActive() {
        return this.active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public void setImages(Set<FeedImage> images) {
        this.images = images;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getCountLike() {
        return countLike;
    }

    public void setCountLike(int countLike) {
        this.countLike = countLike;
    }

    public Set<User> getLikes() {
        return likes;
    }

    public void setLikes(Set<User> likes) {
        this.likes = likes;
    }

    public Set<FeedImage> getImages() {
        return images;
    }

    public List<MultipartFile> getFiles() {
        return files;
    }

    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }

    public boolean getIsUserLike() {
        return this.isUserLike;
    }

    public void setIsUserLike(boolean userLike) {
        isUserLike = userLike;
    }

    public Set<FeedComment> getComments() {
        return comments;
    }

    public void setComments(Set<FeedComment> comments) {
        this.comments = comments;
    }

    public String getFeedId() {
        return feedId;
    }

    public void setFeedId(String feedId) {
        this.feedId = feedId;
    }
}
