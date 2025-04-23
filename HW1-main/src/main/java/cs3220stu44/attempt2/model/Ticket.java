package cs3220stu44.attempt2.model;

import java.util.Date;
import jakarta.persistence.*;

@Entity
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private static int next = 1;
    private int tixNum;
    private String category;
    private String subject;
    private String details;

    @Enumerated(EnumType.STRING)
    private Status status;

    public enum Status {
        OPEN, ASSIGNED, CLOSED
    }

    @ManyToOne
    private User assignedTechnician;

    private Date submitDate;

    @ManyToOne
    private User requester;
    @ManyToOne
    @JoinColumn(name = "assignee_id")
    private User assignee;

    public Ticket(int tixNum, String category, String subject, String details, String status, Date submitDate, User requester, User assignee) {
        this.tixNum = next++;
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

//    public String getStatus() {
//        return status;
//    }
//
//    public void setStatus(String status) {
//        this.status = status;
//    }

    public Date getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
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
}

