package cs3220stu44.attempt2.repository;

import cs3220stu44.attempt2.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepo extends CrudRepository<User, Integer> {
    User findByEmail(String email);
}
