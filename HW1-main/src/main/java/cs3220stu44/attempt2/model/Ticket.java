package cs3220stu44.attempt2.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "tickets")
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int tixNum;
    private String category;
    private String subject;
    private String details;

    private String status;

    public enum Status {
        OPEN, ASSIGNED, CLOSED
    }

    @ManyToOne
    private User assignedTechnician;

    @Column(name = "date_submitted")
    private Date submitDate;

    @ManyToOne
    @JoinColumn(name = "requester_id")
    private User requester;

    @ManyToOne
    @JoinColumn(name = "assignee_id")
    private User assignee;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "ticket_id")
    private List<Comment> comments = new ArrayList<>();

    public Ticket() {}

    public Ticket(String category, String subject, String details, String status, Date submitDate, User requester, User assignee) {
        this.category = category;
        this.subject = subject;
        this.details = details;
        this.submitDate = submitDate;
        this.requester = requester;
        this.assignee = assignee;
    }

    public int getTixNum() {
        return tixNum;
    }

    public void setTixNum(int tixNum) {
        this.tixNum = tixNum;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User getRequester() {
        return requester;
    }

    public void setRequester(User requester) {
        this.requester = requester;
    }

    public User getAssignee() {
        return assignee;
    }

    public void setAssignee(User assignee) {
        this.assignee = assignee;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public void addComment(Comment comment) {}

    public boolean isClosed() {
        return "Closed".equalsIgnoreCase(status);
    }

    public boolean isOpen() {
        return !isClosed();
    }

    public Date getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }

}

