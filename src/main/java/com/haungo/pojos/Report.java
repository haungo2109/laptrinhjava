/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.haungo.pojos;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

/**
 *
 * @author kan_haungo
 */
@Entity
@Table(name = "social_network_report")
public class Report implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String content;
    @ManyToOne
    @JoinColumn(name = "typereport_id", referencedColumnName = "id")
    private TypeReport typeReport;
    @Column(name = "create_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createAt;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.DETACH)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "user_report", referencedColumnName = "id")
    private User userReport;

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
     * @return the typeReport
     */
    public TypeReport getTypeReport() {
        return typeReport;
    }

    /**
     * @param typeReport the typeReport to set
     */
    public void setTypeReport(TypeReport typeReport) {
        this.typeReport = typeReport;
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
     * @return the userReport
     */
    public User getUserReport() {
        return userReport;
    }

    /**
     * @param userReport the userReport to set
     */
    public void setUserReport(User userReport) {
        this.userReport = userReport;
    }
}
