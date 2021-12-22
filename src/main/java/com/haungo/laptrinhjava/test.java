/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.haungo.laptrinhjava;

import com.haungo.pojos.Auction;
import com.haungo.utils.Utils;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

import java.util.Date;

/**
 *
 * @author kan_haungo
 */
public class test {

    public static void main(String[] args) {
        Session session = new LocalSessionFactoryBean().getObject().openSession();
        Auction auction = new Auction();
        auction.setDeadline(new Date());
        auction.setTitle("ddds");
        auction.setDeadline(new Date());
        session.save(auction);
        System.out.println("Success");
    }

    public String log(String value) {
        return value;
    }
}
