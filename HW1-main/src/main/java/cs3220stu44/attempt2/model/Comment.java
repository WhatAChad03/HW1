package cs3220stu44.attempt2.model;

import jakarta.persistence.*;

import java.util.Date;

@Entity
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @ManyToOne
    private User author;
    private String comment;

    @ManyToOne
    private Ticket ticket;
    private Date date;

    public Comment(User author, String comment, Ticket ticket, Date date) {
        this.author = author;
        this.comment = comment;
        this.ticket = ticket;
        this.date = date;
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
    public Date getDate() {
        return date;
    }
}

