package com.sushanthreddy.springboot;

public class GreetingServices {
    private Greetings greeting;
    public GreetingServices(Greetings greeting) {
        this.greeting = greeting;
    }


    public String getMessages() {
        return greeting.greetOcassion()+" "+greeting.greetWishes();
    }

}
