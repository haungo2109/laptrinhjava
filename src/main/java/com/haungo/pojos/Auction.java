/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.haungo.pojos;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "social_network_auction")
public class Auction implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull(message = "{validate.notblank}")
    private String title;

    @NotNull(message = "{validate.notblank}")
    private String content;

    @Column(name = "create_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createAt;
    private boolean active = true;

    @Column(name = "base_price")
    private Double basePrice;
    private String condition;
    private Date deadline;

    @Column(name = "count_comment")
    private Integer countComment;

    @Column(name = "date_success")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateSuccess;

    @Column(name = "accept_price")
    private Double acceptPrice;

    @Column(name = "current_price")
    private Double currentPrice;

    @Column(name = "status_auction")
    private String statusAuction;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "buyer_id", referencedColumnName = "id")
    private User buyler;

    @ManyToOne
    @JoinColumn(name = "payment_method_id", referencedColumnName = "id")
    private Payment payment;
    private Integer rating;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "auction", cascade = CascadeType.REMOVE)
    private Set<AuctionImage> images;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "auction", cascade = CascadeType.REMOVE)
    private Set<AuctionComment> comments;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @Transient
    private List<MultipartFile> files;
    @Transient
    private String categoryId;
    @Transient
    private String date;

    public Auction(){}
    public Auction(String title, String content, Double basePrice){
        this.title= title;
        this.basePrice = basePrice;
        this.content = content;
        this.deadline = new Date();
        this.createAt = new Date();
    }
    public AuctionComment getCommentByUserId(Integer id){
        for (AuctionComment auctionComment: this.comments){
            if (auctionComment.getUser().getId().equals(id)) return auctionComment;
        }
        return null;
    }
    public List<MultipartFile> getFiles() {
        return files;
    }

    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }

    public Payment getPayment() {
        return this.payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public User getBuyler() {
        return buyler;
    }

    public void setBuyler(User user) {
        this.buyler = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the basePrice
     */
    public Double getBasePrice() {
        return basePrice;
    }

    /**
     * @param basePrice the basePrice to set
     */
    public void setBasePrice(Double basePrice) {
        this.basePrice = basePrice;
    }

    /**
     * @return the condition
     */
    public String getCondition() {
        return condition;
    }

    /**
     * @param condition the condition to set
     */
    public void setCondition(String condition) {
        this.condition = condition;
    }

    /**
     * @return the deadline
     */
    public Date getDeadline() {
        return deadline;
    }

    /**
     * @param deadline the deadline to set
     */
    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    /**
     * @return the dateSuccess
     */
    public Date getDateSuccess() {
        return dateSuccess;
    }

    /**
     * @param dateSuccess the dateSuccess to set
     */
    public void setDateSuccess(Date dateSuccess) {
        this.dateSuccess = dateSuccess;
    }

    /**
     * @return the acceptPrice
     */
    public Double getAcceptPrice() {
        return acceptPrice;
    }

    /**
     * @param acceptPrice the acceptPrice to set
     */
    public void setAcceptPrice(Double acceptPrice) {
        this.acceptPrice = acceptPrice;
    }

    public Category getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(Category category) {
        this.category = category;
    }

    /**
     * @return the rating
     */
    public Integer getRating() {
        return rating;
    }

    /**
     * @param rating the rating to set
     */
    public void setRating(Integer rating) {
        this.rating = rating;
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

    /**
     * @param createAt the createAt to set
     */
    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    /**
     * @return the active
     */
    public Boolean getActive() {
        return active;
    }

    /**
     * @param active the active to set
     */
    public void setActive(Boolean active) {
        this.active = active;
    }

    public Set<AuctionImage> getImages() {
        return images;
    }

    public void setImages(Set<AuctionImage> images) {
        this.images = images;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Integer getCountComment() {
        return countComment;
    }

    public void setCountComment(Integer countComment) {
        this.countComment = countComment;
    }

    public String getStatusAuction() {
        return statusAuction;
    }

    public void setStatusAuction(String statusAuction) {
        this.statusAuction = statusAuction;
    }

    public Double getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(Double currentPrice) {
        this.currentPrice = currentPrice;
    }

    public Set<AuctionComment> getComments() {
        return comments;
    }

    public void setComments(Set<AuctionComment> comments) {
        this.comments = comments;
    }
}
