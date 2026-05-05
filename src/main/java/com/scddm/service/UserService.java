package com.scddm.service;

import com.scddm.mapper.UserMapper;
import com.scddm.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserMapper mapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public User login(String username, String password) {
        User user = mapper.selectByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    public void register(User user) {

        user.setRole("user");
        user.setEnabled(1);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        mapper.insert(user);
    }

    public void add(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        mapper.insert(user);
    }

    public List<User> list(){
        return mapper.selectAll();
    }

    public void update(User user){
        mapper.update(user);
    }

    public void delete(Integer id){
        mapper.delete(id);
    }

    public User findByUsername(String username){
        return mapper.selectByUsername(username);
    }
}
