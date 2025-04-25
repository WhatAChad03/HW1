package cs3220stu44.attempt2.model;

import jakarta.persistence.*;

import java.sql.Timestamp;
import java.util.Date;
import java.time.LocalDateTime;

@Entity
@Table(name = "comments")
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "author_id")
    private User author;

    private String comment;

    @ManyToOne
    private Ticket ticket;

    private LocalDateTime date;

    public Comment() {}

    public Comment(User author, String comment, Ticket ticket, Date date) {
        this.author = author;
        this.comment = comment;
        this.ticket = ticket;
        this.date = LocalDateTime.now();
    }

    public int getId() {
        return id;
    }

    public User getAuthor() {
        return author;
    }

    public String getComment() {
        return comment;
    }

    public Ticket getTicket() {
        return ticket;
    }

    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
    }

    public LocalDateTime getDate() {
        return date;
    }
}
