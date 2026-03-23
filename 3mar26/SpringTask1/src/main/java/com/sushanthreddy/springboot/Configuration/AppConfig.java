package com.sushanthreddy.springboot.Configuration;

import com.sushanthreddy.springboot.Address;
import com.sushanthreddy.springboot.User;
import com.sushanthreddy.springboot.Repository.UserRepository;
import com.sushanthreddy.springboot.Services.UserService;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
@Configuration
public class AppConfig {
    @Bean
    public Address address() {
        return new Address(506009, "WARANGAL");
    }

    @Bean
    public User user() {
        return new User("SUSHANTH REDDY", 22, "sushanthreddy03@gmail.com", address());
    }

    @Bean
    public UserRepository userRepository(User user) {
        return new UserRepository(user);

    }

    @Bean
    public UserService userService(UserRepository userRepository) {
        return new UserService(userRepository);
    }
}