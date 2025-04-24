package cs3220stu44.attempt2.controller;

import cs3220stu44.attempt2.DataStorage;
import cs3220stu44.attempt2.SessionStorage;
import cs3220stu44.attempt2.model.Comment;
import cs3220stu44.attempt2.model.Ticket;
import cs3220stu44.attempt2.model.User;
import cs3220stu44.attempt2.repository.CommentRepo;
import cs3220stu44.attempt2.repository.TicketRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;


@Controller
public class TicketController {
    private final SessionStorage sessionStorage;
    private final TicketRepo ticketRepo;
    private final CommentRepo commentRepo;

    public TicketController(TicketRepo ticketRepo, SessionStorage sessionStorage, CommentRepo commentRepo) {
        this.ticketRepo = ticketRepo;
        this.sessionStorage = sessionStorage;
        this.commentRepo = commentRepo;
    }

    @RequestMapping("/tickets")
    public String index(Model model) {
        if(!sessionStorage.isLoggedIn()) {
            return "redirect:/";
        }

        model.addAttribute("tickets", ticketRepo.findAll());
        model.addAttribute("dateFormat", ticketRepo.getDateFormat());
        return "tickets/index";
    }

    @GetMapping("/tickets/{tixNum}")
    public String view(@PathVariable int tixNum, Model model) {
        if(!sessionStorage.isLoggedIn()) {
            return "redirect:/";
        }

        Ticket ticket = (Ticket) ticketRepo.findAll(tixNum);
        if(ticket == null) {
            return "redirect:/tickets";
        }
        List<Comment> comments = commentRepo.findById(tixNum);

        model.addAttribute("ticket", ticket);
        model.addAttribute("comments", comments);
        model.addAttribute("dateFormat", ticketRepo.findAll());
        return "tickets/view";
    }

    @PostMapping("/tickets/{tixNum}/comments")
    public String addComment(@PathVariable int tixNum,
                             @RequestParam String comments,
                             Model model) {
        if(!sessionStorage.isLoggedIn()) {
            return "redirect:/";
        }
        User user = sessionStorage.getUser();

        Ticket ticket = ticketRepo.findById(tixNum);
        if(ticket == null) {
            return "redirect:/tickets";
        }

        Comment newComment = new Comment(user, comments, ticket, new Date());
        ticketRepo.addCommentToTicket(tixNum, newComment);
        model.addAttribute("ticket", ticketRepo.findById(tixNum));
        model.addAttribute("comments", ticketRepo.findAll());
        return "redirect:/tickets/" + tixNum;
    }

    //show create form
    @GetMapping("/tickets/create")
    public String create(Model model) {
        if(!sessionStorage.isLoggedIn()) {
            return "redirect:/";
        }
        User currentUser = sessionStorage.getUser();
        if(currentUser == null) {
            return "redirect:/";
        }
        model.addAttribute("currentUser", currentUser);
        return "tickets/create";
    }

    //creating tix & checking
    @PostMapping("/tickets/create")
    public String createTix(@RequestParam String category,
                            @RequestParam String subject,
                            @RequestParam String details,
                            Model model) {
        if(!sessionStorage.isLoggedIn()) {
            return "redirect:/";
        }

        User requester = sessionStorage.getUser();
        model.addAttribute("requester", requester);

        Ticket newTicket = new Ticket(ticketRepo.getNextTixNum(), category, subject, details, "Open", new Date(), requester, null);

        ticketRepo.save(newTicket);
        return "redirect:/tickets";
    }
}

