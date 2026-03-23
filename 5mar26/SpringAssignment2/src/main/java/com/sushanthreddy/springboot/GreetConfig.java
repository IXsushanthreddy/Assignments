package com.sushanthreddy.springboot;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan("com.sushanthreddy.springboot")
public class GreetConfig {
    @Bean
    public Greetings greetings(){
        return new Greetings();
    }
    @Bean
    public GreetingServices greetingsServices(){
        return  new GreetingServices(greetings());
    }

}
