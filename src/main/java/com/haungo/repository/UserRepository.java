/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.haungo.repository;

import com.haungo.pojos.User;
import java.util.List;

/**
 *
 * @author kan_haungo
 */
public interface UserRepository {

    List<User> getUsers();

    User getUserByUsername(String username);

    User getUserById(Integer userId);

    boolean addUser(User user);
}
