package cs3220stu44.attempt2;

import org.springframework.stereotype.Component;
import cs3220stu44.attempt2.model.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Component
public class DataStorage {
    private int tixNum = 0;
    public List<User> users;
    public List<Ticket> tickets;
    public List<Comment> comments;

    private final SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

    public DataStorage() {
        users = new ArrayList<>();
        tickets = new ArrayList<>();

        User josh = new User(0, "Josh", "josh@example.com", "abcd", false);
        User eva = new User(1, "Eva", "eva@example.com","abcd", false);
        User john = new User(2, "John", "john@example.com","abcd", true);

        users.add(josh);
        users.add(eva);
        users.add(john);

        Calendar cal  = Calendar.getInstance();
        cal.set(2025, 2, 13);

        Date date = cal.getTime();

        tickets.add(new Ticket(tixNum, "Software", "Tomcat on CS3 stopped", "Crash", "Open", date, josh, null));
        tickets.add(new Ticket(tixNum, "hardware", "Printer problem in ECST mailroom", "No color", "Closed", date, eva, john));

        comments = new ArrayList<>();
        comments.add(new Comment(josh, "this is urgent!", tickets.get(0), date));
        comments.add(new Comment(john, "hurry up and fix it", tickets.get(1), date));

    }

    public Ticket getTicket(int tixNum) {
        for(Ticket ticket : tickets) {
            if(ticket.getTixNum() == tixNum) {
                return ticket;
            }
        }
        return null;
    }

    public List<User> getUsers() {return users;}
    public List<Ticket> getTickets() {return tickets;}
    public List<Comment> getComments() {return comments;}

    public void addCommentToTicket(int tixNum, Comment comment) {
        Ticket ticket = getTicket(tixNum);
        if(ticket != null) {
            comments.add(comment);
        }
    }
    public List<Comment> getComments(int tixNum) {
        List<Comment> tixComments = new ArrayList<>();
        for(Comment comment : comments) {
            if(comment.getTicket().getTixNum() == tixNum) {
                tixComments.add(comment);
            }
        }
        return tixComments;
    }

    public SimpleDateFormat getDateFormat() {return dateFormat;}
    public int getNextTixNum() {return tixNum++;}
    public void add(Ticket ticket) {
        tickets.add(ticket);
    }
    public User authenticate(String email, String password) {
        return users.stream()
                .filter(user -> user.getEmail().equals(email)
                        && user.getPassword().equals(password))
                .findFirst()
                .orElse(null);

    }

}

