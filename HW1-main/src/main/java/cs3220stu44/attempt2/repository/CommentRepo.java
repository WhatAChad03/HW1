package cs3220stu44.attempt2.repository;

import cs3220stu44.attempt2.model.Comment;
import org.springframework.data.repository.CrudRepository;

public interface CommentRepo extends CrudRepository<Comment, Integer> {
}
