/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.haungo.service;

import com.haungo.pojos.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 *
 * @author kan_haungo
 */
public interface UserService extends UserDetailsService {

    List<User> getUsers();

    User getUserById(Integer id);

    User getUserByUsername(String username);

    boolean addUser(User user);
}
