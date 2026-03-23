package com.sushanthreddy.springboot.Services;

import com.sushanthreddy.springboot.Repository.UserRepository;
import com.sushanthreddy.springboot.User;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;

    }
    public User getUser(){
        return userRepository.findUser();
    }
}
