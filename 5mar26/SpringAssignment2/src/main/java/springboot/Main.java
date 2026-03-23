package springboot;


import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {
    public static void main(String[] args) {
        var context = new AnnotationConfigApplicationContext(GreetConfig.class);
        GreetingServices greeting = context.getBean(GreetingServices.class);
        System.out.println(greeting.getMessage());
    }
}
