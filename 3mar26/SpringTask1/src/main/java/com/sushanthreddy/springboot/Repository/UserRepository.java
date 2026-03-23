package com.sushanthreddy.springboot.Repository;

import com.sushanthreddy.springboot.User;

public class UserRepository {
    private User user;
    public UserRepository(User user){
        this.user=user;
    }
    public User findUser(){
    return user;
    }
}

