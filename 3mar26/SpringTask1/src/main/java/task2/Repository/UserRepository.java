package task2.Repository;

import org.springframework.stereotype.Repository;
import task2.User;

@Repository
public class UserRepository {
    private User user;
    public UserRepository(User user){
        this.user=user;
    }
    public User findUser(){
    return user;
    }
}

