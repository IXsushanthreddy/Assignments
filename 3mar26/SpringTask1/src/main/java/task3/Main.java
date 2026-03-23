package task3;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import task3.Configuration.CircularDependencyConfig;

public class Main {
    public static void main(String[] args) {
        System.out.println("CircularDependencyConfig");
        var context=new AnnotationConfigApplicationContext(CircularDependencyConfig.class);
        System.out.println(context.getBean(classesObjects.class));

    }
}
