package cs3220stu44.attempt2.model;

import java.time.LocalDateTime;
import java.util.List;

public class TicketDetailsDTO {
    public String subject;
    public String category;
    public String status;
    public LocalDateTime submitDate;

    public UserDTO requester;
    public UserDTO assignee;
    public List<CommentDTO> comments;

    // nested DTOs
    public static class UserDTO {
        public String name;
        public String email;
        public String phone;
    }

    public static class CommentDTO {
        public String comment;
        public String authorName;
        public LocalDateTime date;
    }
}

