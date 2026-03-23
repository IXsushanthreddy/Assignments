package springboot;

import org.springframework.stereotype.Service;

@Service
public class Greeting {
    public String greet() {
        return "Hello Happy New Year";
    }
}
