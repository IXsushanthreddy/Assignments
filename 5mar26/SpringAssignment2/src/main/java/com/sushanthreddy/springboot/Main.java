package com.sushanthreddy.springboot;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {
    public static void main(String[] args) {
        var context = new AnnotationConfigApplicationContext(GreetConfig.class);
        GreetingClient greetingClient = context.getBean(GreetingClient.class);
        System.out.println(greetingClient.getGreetingMessage());
    }
}
