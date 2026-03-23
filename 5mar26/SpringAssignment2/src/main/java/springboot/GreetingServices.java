package springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service

@Component
public class GreetingServices {
    @Autowired
    private Greeting greetingService;

    public String getMessage() {
        return greetingService.greet();
    }

}
