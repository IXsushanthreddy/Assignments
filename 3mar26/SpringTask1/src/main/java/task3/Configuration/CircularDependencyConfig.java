package task3.Configuration;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import task3.classesObjects;
import task3.objectsClasses;

public class CircularDependencyConfig {
    @Bean
    public classesObjects classes(){
        return new classesObjects();
    }
    @Bean
    public objectsClasses objects(){
        return new objectsClasses();
    }
    public static void main(String[] args) {
        System.out.println("CircularDependencyConfig");
        var context=new AnnotationConfigApplicationContext(CircularDependencyConfig.class);
        System.out.println(context.getBean(classesObjects.class));

    }
}
