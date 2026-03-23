package com.sushanthreddy.springboot;

import com.sushanthreddy.springboot.Configuration.AppConfig;
import com.sushanthreddy.springboot.Repository.UserRepository;
import com.sushanthreddy.springboot.Services.UserService;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {
    public static void main(String[] args) {


        var context = new AnnotationConfigApplicationContext(AppConfig.class);
        UserRepository userRepository = context.getBean(UserRepository.class);
        UserService userService = context.getBean(UserService.class);
        System.out.println(userRepository.findUser());


    }
}
