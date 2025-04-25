package cs3220stu44.attempt2.controller;

import cs3220stu44.attempt2.SessionStorage;
import cs3220stu44.attempt2.model.Comment;
import cs3220stu44.attempt2.model.Ticket;
import cs3220stu44.attempt2.model.User;
import cs3220stu44.attempt2.repository.TicketRepo;
import cs3220stu44.attempt2.repository.UserRepo;
import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;


@Controller
public class TicketController {
    private final SessionStorage sessionStorage;
    private final TicketRepo ticketRepo;
    private final UserRepo userRepo;

    public TicketController(TicketRepo ticketRepo, SessionStorage sessionStorage, UserRepo userRepo) {
        this.ticketRepo = ticketRepo;
        this.sessionStorage = sessionStorage;
        this.userRepo = userRepo;
    }

    @PostConstruct
    public void initializeData() {
        if (userRepo.count() == 0) {
            // Create regular users
            User josh = new User("Josh", "josh@example.com", "abcd", false);
            User eva = new User("Eva", "eva@example.com","abcd", false);

            // Create technicians
            User john = new User("John", "john@example.com","abcd", true);
            User jane = new User("Jane", "jane@example.com", "abcd",  true);

            Calendar cal  = Calendar.getInstance();
            cal.set(2025, 2, 13);

            Date date = cal.getTime();

            userRepo.save(josh);
            userRepo.save(eva);
            userRepo.save(john);
            userRepo.save(jane);

            // Create sample tickets
            int tixNum = ticketRepo.getNextTixNum();
            ticketRepo.save(new Ticket("Software", "Tomcat on CS3 stopped", "Crash", "Open", date, josh, null));
            ticketRepo.save(new Ticket("hardware", "Printer problem in ECST mailroom", "No color", "Closed", date, eva, john));
        }

    }

    @RequestMapping("/tickets")
    public String index(Model model) {
        if(!sessionStorage.isLoggedIn()) {
            return "redirect:/";
        }

        model.addAttribute("tickets", ticketRepo.findAll());
        model.addAttribute("currentUser", sessionStorage.getUser());
        model.addAttribute("dateFormat", ticketRepo.getDateFormat());
        return "tickets/index";
    }

    @GetMapping("/tickets/create")
    public String createTicket(Model model) {
        if(!sessionStorage.isLoggedIn()) {
            return "redirect:/";
        }
        List<User> availableTechnicians = userRepo.findByTechnicianTrue();
        model.addAttribute("availableTechnicians", availableTechnicians);
        return "tickets/create";
    }

    @PostMapping("/tickets/create")
    public String createTicket(@RequestParam String category,
                               @RequestParam String subject,
                               @RequestParam String details,
                               @RequestParam(required = false) Integer assigneeId,
                               Model model) {
        if(!sessionStorage.isLoggedIn()) {
            return "redirect:/";
        }

        User requester = sessionStorage.getUser();
        Optional<User> assignee = userRepo.findById(assigneeId);
        if(assignee.isEmpty()) return "redirect:/tickets/create";

        ticketRepo.save(new Ticket(category, subject, details, "Open", new Date(), requester, assignee.get()));
        return "redirect:/tickets";
    }

    @GetMapping("/tickets/{tixNum}")
    public String view(@PathVariable int tixNum, Model model) {
        if(!sessionStorage.isLoggedIn()) {
            return "redirect:/";
        }

        Optional<Ticket> ticket = ticketRepo.findById(tixNum);
        if(ticket.isEmpty()) {
            return "redirect:/tickets";
        }

        User sessionUser = sessionStorage.getUser();
        List<User> availableTechnicians = userRepo.findByTechnicianTrue();

        model.addAttribute("ticket", ticket.get());
        model.addAttribute("sessionUser", sessionUser);
        model.addAttribute("availableTechnicians", availableTechnicians);
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

        Optional<Ticket> optionalTicket = ticketRepo.findById(tixNum);
        if(optionalTicket.isEmpty()) {
            return "redirect:/tickets";
        }

        Ticket ticket = optionalTicket.get();
        if (ticket.isClosed()) {
            return "redirect:/tickets/" + tixNum;
        }

        User sessionUser = sessionStorage.getUser();
        Comment comment = new Comment(sessionUser, comments, ticket, new Date());
        ticket.addComment(comment);
        ticketRepo.save(ticket);
        model.addAttribute("ticket", ticketRepo.findById(tixNum));
        model.addAttribute("comments", ticketRepo.findAll());
        return "redirect:/tickets/" + tixNum;
    }

    @PostMapping("/tickets/{tixNum}/assign")
    public String assignTechnician(@PathVariable int tixNum,
                                    @RequestParam Integer assigneeId) {
        if(!sessionStorage.isLoggedIn()) {
            return "redirect:/";
        }

        Optional<User> optionalTechnician = userRepo.findById(assigneeId);
        if(optionalTechnician.isEmpty()) return "redirect:/tickets/" + tixNum;

        Optional<Ticket> optionalTicket = ticketRepo.findById(tixNum);
        if(optionalTicket.isEmpty()) return "redirect:/tickets";

        Ticket ticket = optionalTicket.get();
        ticket.setAssignee(optionalTechnician.get());
        ticketRepo.save(ticket);
        return "redirect:/tickets/" + tixNum;
    }

    @GetMapping("/tickets/{tixNum}/close")
    public String closeTicket(@PathVariable int tixNum) {
        if(!sessionStorage.isLoggedIn()) {
            return "redirect:/";
        }

        Optional<Ticket> optionalTicket = ticketRepo.findById(tixNum);
        if(optionalTicket.isEmpty()) return "redirect:/tickets";

        Ticket ticket = optionalTicket.get();
        ticket.setStatus("Closed");
        ticketRepo.save(ticket);
        return "redirect:/tickets/" + tixNum;
    }

    //show create form
//    @GetMapping("/tickets/create")
//    public String create(Model model) {
//        if(!sessionStorage.isLoggedIn()) {
//            return "redirect:/";
//        }
//        User currentUser = sessionStorage.getUser();
//        if(currentUser == null) {
//            return "redirect:/";
//        }
//        model.addAttribute("currentUser", currentUser);
//        return "tickets/create";
//    }
//
//    //creating tix & checking
//    @PostMapping("/tickets/create")
//    public String createTix(@RequestParam String category,
//                            @RequestParam String subject,
//                            @RequestParam String details,
//                            Model model) {
//        if(!sessionStorage.isLoggedIn()) {
//            return "redirect:/";
//        }
//
//        User requester = sessionStorage.getUser();
//        model.addAttribute("requester", requester);
//
//        Ticket newTicket = new Ticket(ticketRepo.getNextTixNum(), category, subject, details, "Open", new Date(), requester, null);
//
//        ticketRepo.save(newTicket);
//        return "redirect:/tickets";
//    }
}

