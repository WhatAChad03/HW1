package cs3220stu44.attempt2.repository;

import cs3220stu44.attempt2.model.Ticket;
import org.springframework.data.repository.CrudRepository;

public interface TicketRepo extends CrudRepository<Ticket, Integer> {

    Object getDateFormat();

    Object findAll(int tixNum);
}
