package com.haungo.pojos;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "social_network_notification")
public class Notification implements Serializable {
    public static final String LikeMess = "Có người thích bài viết của bạn";
    public static final String CommentFeedMess = "Có người bình luận bài viết của bạn";
    public static final String WonAuction = "Bạn đã đấu giá thành công";
    public static final String AddAuctionComment = "Có người tham gia đấu giá";
    public static final String AddMessage = "Bạn có tin nhắn";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String title;
    private String content;
    private String url;
    @Column(name = "create_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createAt;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;
    private Boolean seen;

    public Notification(String title, String content, String url, User user) {
        this.createAt = new Date();
        this.seen = false;
        this.title = title;
        this.content = content;
        this.url = url;
        this.user = user;
    }
    public Notification(String title, String content, User user) {
        this.createAt = new Date();
        this.seen = false;
        this.title = title;
        this.content = content;
        this.user = user;
    }

    public Notification() {
    }
    public static String genContent(User user, String mess){
        return String.format("%s %s %s", user.getFirstName(), user.getLastName(), mess);
    };
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Boolean getSeen() {
        return seen;
    }

    public void setSeen(Boolean seen) {
        this.seen = seen;
    }
}
