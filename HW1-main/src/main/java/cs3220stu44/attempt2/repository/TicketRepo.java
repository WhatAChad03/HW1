package cs3220stu44.attempt2.repository;

import cs3220stu44.attempt2.model.Ticket;
import cs3220stu44.attempt2.model.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface TicketRepo extends CrudRepository<Ticket, Integer> {
    static Optional<Ticket> findById(Long ticketId) {
        return Optional.empty();
    }


    static List<Ticket> findByRequesterId(Long userId) {
        return List.of();
    }
}
