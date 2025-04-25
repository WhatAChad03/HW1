package cs3220stu44.attempt2.repository;

import cs3220stu44.attempt2.model.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepo extends CrudRepository<User, Integer> {
    Optional<User> findByEmail(String email);
    Optional<User> findByName(String name);
    List<User> findByTechnicianTrue();

}
