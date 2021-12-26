/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.haungo.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.haungo.pojos.User;
import com.haungo.repository.UserRepository;
import com.haungo.service.UserService;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author kan_haungo
 */

@Service("userDetailsService")
public class UserServiceImpl implements UserService {

    @Autowired private Cloudinary cloudinary;
    @Autowired private BCryptPasswordEncoder passwordEncoder;
    @Autowired private UserRepository userRepository;

    @Override
    public List<User> getUsers() {
        return this.userRepository.getUsers();
    }

    @Override
    public User getUserById(Integer id) {
        User user = this.userRepository.getUserById(id);
        return user;
    }

    @Override
    public User getUserByUsername(String username) {
        User user = this.userRepository.getUserByUsername(username);
        return user;
    }

    @Override
    public boolean addUser(User user) {
        //check usernamr exsit
        User u = this.userRepository.getUserByUsername(user.getUsername());
        if (u != null) return false;

        try {
            String pass = user.getPassword();
            user.setPassword(this.passwordEncoder.encode(pass));
            user.setUserRole(User.USER);

            Map params = ObjectUtils.asMap(
                    "folder", "assets/avatar",
                    "overwrite", true,
                    "resource_type", "auto"
            );

            Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(), params);
            String avatarUrl = (String) r.get("secure_url");
            user.setAvatar(avatarUrl);
            return this.userRepository.addUser(user);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = this.userRepository.getUserByUsername(username);
        if (user == null){ //check user exsit
            throw new UsernameNotFoundException("Người dùng không tồn tại");
        }

        Set<GrantedAuthority> auth = new HashSet<>();
        auth.add(new SimpleGrantedAuthority(user.getUserRole()));

        return new org.springframework.security.core.userdetails.User(
                user.getUsername(), user.getPassword(), auth
        );
    }
}
