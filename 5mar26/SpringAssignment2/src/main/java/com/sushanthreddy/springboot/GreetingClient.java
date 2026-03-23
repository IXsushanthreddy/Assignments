package com.sushanthreddy.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GreetingClient {
    @Autowired
    private GreetingServices greetingServices;

    public String getGreetingMessage() {
        return greetingServices.getMessages();
    }
}
