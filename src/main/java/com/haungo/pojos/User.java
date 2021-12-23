package com.haungo.pojos;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.persistence.*;
import javax.validation.constraints.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author kan_haungo
 */
@Entity
@Table(name = "social_network_user")
public class User implements Serializable {
    public static final String ADMIN = "ROLE_ADMIN";
    public static final String USER = "ROLE_USER";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @JsonIgnore
    @Column(unique = true)
    @NotNull
    @Size(min = 4, max = 150, message = "{validate.username.size}")
    private String username;

    @JsonIgnore
    @Size(min = 6, message = "{validate.password.size}")
    @NotNull
    private String password;

    @Column(name = "first_name")
    @NotNull
    @NotBlank(message = "{validate.firstName.notBlank}")
    private String firstName;

    @Column(name = "last_name")
    @NotNull
    @NotBlank(message = "{validate.lastName.notBlank}")
    private String lastName;

    @JsonIgnore
    @NotNull
    @Email(message = "{validate.email}")
    private String email;

    @Column(name = "is_active")
    @JsonIgnore
    private boolean active = true;

    @Column(unique = true)
    @NotNull
    @JsonIgnore
    @Pattern(regexp = "[0-9]{10}", message = "{validate.phone}")
    private String phone;
    private String avatar;
    @JsonIgnore
    private String address;

    @JsonIgnore
    @Temporal(TemporalType.DATE)
    @Past
    private Date birthday;
    @JsonIgnore
    private Integer rating;

    @JsonIgnore
    @Column(name = "user_role")
    private String userRole;

    @JsonIgnore
    @OneToMany(mappedBy = "user")
    private List<Feed> feeds;

    @JsonIgnore
    @OneToMany(mappedBy = "user")
    private List<Auction> auctions;

    @JsonIgnore
    @ManyToMany(mappedBy = "likes")
    private Set<Feed> feedlikes;

    @JsonIgnore
    @Transient
    @NotNull(message = "{validate.file.notNull}")
    private MultipartFile file;

    public User(Integer id) {
        this.id = id;
    }

    public User() {
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return this.password;
    }

    /**
     * @param password the id to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the active
     */
    public boolean getActive() {
        return active;
    }

    /**
     * @param active the active to set
     */
    public void setActive(boolean active) {
        this.active = active;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the avatar
     */
    public String getAvatar() {
        return avatar;
    }

    /**
     * @param avatar the avatar to set
     */
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the birthday
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * @param birthday the birthday to set
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * @return the rating
     */
    public int getRating() {
        return rating;
    }

    /**
     * @param rating the rating to set
     */
    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public List<Feed> getFeeds() {
        return feeds;
    }

    public void setFeeds(List<Feed> feeds) {
        this.feeds = feeds;
    }

    public List<Auction> getAuctions() {
        return auctions;
    }

    public void setAuctions(List<Auction> auctions) {
        this.auctions = auctions;
    }

    public Set<Feed> getFeedlikes() {
        return feedlikes;
    }

    public void setFeedlikes(Set<Feed> feedlikes) {
        this.feedlikes = feedlikes;
    }
}
