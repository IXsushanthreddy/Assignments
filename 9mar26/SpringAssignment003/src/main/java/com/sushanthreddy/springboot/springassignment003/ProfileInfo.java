package com.sushanthreddy.springboot.springassignment003;

import org.jspecify.annotations.NonNull;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class ProfileInfo implements CommandLineRunner {
    @Value("${spring.application.name}")
    private String applicationName;
    @Value("${app.message}")
    private String message;

    @Override
    public void run(String @NonNull ... args) throws Exception {
        System.out.println(applicationName);

        System.out.println(message);

    }


}
