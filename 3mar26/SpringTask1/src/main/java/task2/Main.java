package task2;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import task2.Configuration.AppConfig;
import task2.Service.UserService;

public class Main {
    public static void main(String[] args) {


        var context = new AnnotationConfigApplicationContext(AppConfig.class);
        UserService userService = context.getBean(UserService.class);

        System.out.println("3:Dependency Injection Completed");

        System.out.println("4:Bean Ready to Use");
        System.out.println(userService.getUser());
        context.close();

    }
}
