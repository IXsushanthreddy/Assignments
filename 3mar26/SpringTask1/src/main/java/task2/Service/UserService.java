package task2.Service;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import task2.User;
import task2.Repository.UserRepository;

public class UserService implements InitializingBean, DisposableBean {
    private UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;

    }
    public User getUser(){
        return userRepository.findUser();
    }
    @PreDestroy
    public void preDestroy(){
        System.out.println(" 5:@PreDestroy: Bean about to be destroyed");
    }

    @Override
    public void destroy() throws Exception {
        System.out.println("6:Bean destroyed");

    }
    @PostConstruct
    public void postConstruct(){
        System.out.println("1:UserService postConstruct");

    }


    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println("2:Bean afterPropertiesSet");
    }
}
