package cs3220stu44.attempt2.controller;

import cs3220stu44.attempt2.model.Comment;
import cs3220stu44.attempt2.model.Ticket;
import cs3220stu44.attempt2.model.TicketDetailsDTO;
import org.springframework.http.ResponseEntity;
import cs3220stu44.attempt2.repository.TicketRepo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


import java.util.List;
import java.util.Optional;

public class TicketApiController {
    @GetMapping("/api/users/{userId}/tickets")
    public ResponseEntity<List<Ticket>> getTicketsByUserId(@PathVariable Long userId) {
        List<Ticket> tickets = TicketRepo.findByRequesterId(userId);
        if (tickets.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(tickets);
    }

    @GetMapping("/api/tickets/{ticketId}")
    public ResponseEntity<TicketDetailsDTO> getTicketDetails(@PathVariable Long ticketId) {
        Optional<Ticket> optionalTicket = TicketRepo.findById(ticketId);
        if (optionalTicket.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        Ticket ticket = optionalTicket.get();
        TicketDetailsDTO dto = new TicketDetailsDTO();

        dto.subject = ticket.getSubject();
        dto.category = ticket.getCategory();
        dto.status = ticket.getStatus();
        dto.submitDate = ticket.getSubmitDate();

        // requester
        TicketDetailsDTO.UserDTO requesterDTO = new TicketDetailsDTO.UserDTO();
        requesterDTO.name = ticket.getRequester().getName();
        requesterDTO.email = ticket.getRequester().getEmail();
        dto.requester = requesterDTO;

        // assignee
        if (ticket.getAssignee() != null) {
            TicketDetailsDTO.UserDTO assigneeDTO = new TicketDetailsDTO.UserDTO();
            assigneeDTO.name = ticket.getAssignee().getName();
            assigneeDTO.email = ticket.getAssignee().getEmail();
            dto.assignee = assigneeDTO;
        }

        // comments
        dto.comments = ticket.getComments().stream().map(comment -> {
            TicketDetailsDTO.CommentDTO c = new TicketDetailsDTO.CommentDTO();
            c.comment = comment.getComment();
            c.authorName = comment.getAuthor().getName();
            c.date = comment.getDate();
            return c;
        }).toList();

        return ResponseEntity.ok(dto);
    }

}
