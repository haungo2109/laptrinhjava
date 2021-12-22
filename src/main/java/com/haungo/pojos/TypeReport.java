/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.haungo.pojos;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author kan_haungo
 */
@Entity
@Table(name = "social_network_typereport")
public class TypeReport implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "type")
    private String name;

    public TypeReport() {
    }

    public TypeReport(Integer id) {
        this.id = id;
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
     * @return the type
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the type to set
     */
    public void setName(String name) {
        this.name = name;
    }
}
