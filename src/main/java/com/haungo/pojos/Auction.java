/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.haungo.pojos;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "social_network_auction")
public class Auction implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @NotNull
    @NotBlank(message = "{validate.notblank}")
    private String title;

    @Column(nullable = false)
    @NotNull
    @NotBlank(message = "{validate.notblank}")
    private String content;

    @Column(name = "create_at", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createAt;
    private boolean active = true;

    @Column(name = "base_price")
    private Float basePrice;

    @Column
    private String condition;
    private Date deadline;

    @Column(name = "count_comment")
    private Integer countComment;

    @Column(name = "date_success")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateSuccess;

    @Column(name = "accept_price")
    private Float acceptPrice;

    @Column(name = "status_auction")
    @Enumerated(EnumType.STRING)
    private StatusAuction statusAuction;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    private Category category;

    @ManyToOne()
    @JoinColumn(name = "buyer_id", referencedColumnName = "id")
    private User buyler;

    @ManyToOne()
    @JoinColumn(name = "payment_method_id", referencedColumnName = "id")
    private Payment payment;
    private Integer rating;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "auction", cascade = CascadeType.REMOVE)
    private List<AuctionImage> images;

    @ManyToOne()
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @Transient
    private List<MultipartFile> files;
    @Transient
    private String categoryId;
    @Transient
    private String date;

    public Auction(){};
    public Auction(String title, String content, Float basePrice){
        this.title= title;
        this.basePrice = basePrice;
        this.content = content;
        this.deadline = new Date();
        this.createAt = new Date();
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
    public Float getBasePrice() {
        return basePrice;
    }

    /**
     * @param basePrice the basePrice to set
     */
    public void setBasePrice(Float basePrice) {
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
    public Float getAcceptPrice() {
        return acceptPrice;
    }

    /**
     * @param acceptPrice the acceptPrice to set
     */
    public void setAcceptPrice(Float acceptPrice) {
        this.acceptPrice = acceptPrice;
    }

    /**
     * @return the statusAuction
     */
    public StatusAuction getStatusAuction() {
        return statusAuction;
    }

    /**
     * @param statusAuction the statusAuction to set
     */
    public void setStatusAuction(StatusAuction statusAuction) {
        this.statusAuction = statusAuction;
    }

    /**
     * @return the category
     */
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

    public List<AuctionImage> getImages() {
        return images;
    }

    public void setImages(List<AuctionImage> images) {
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
}
