package cs3220stu44.attempt2.controller;

import cs3220stu44.attempt2.SessionStorage;
import cs3220stu44.attempt2.model.User;
import cs3220stu44.attempt2.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import java.util.List;
import java.util.Optional;

@Controller
public class AuthController {
    private final UserRepo userRepo;
    private final SessionStorage sessionStorage;

    public AuthController(UserRepo userRepo, SessionStorage sessionStorage) {
        this.userRepo = userRepo;
        this.sessionStorage = sessionStorage;
    }

    @GetMapping("/login")
    public String loginForm(@RequestParam(required = false) String error, Model model) {
        if (error != null) {
            model.addAttribute("error", "invalild credentials");
        }
        return "login";
    }

    @PostMapping("/login")
    public String loginSubmit(@RequestParam String email,
                              @RequestParam String password,
                              Model model) {
        if (sessionStorage.isLoggedIn()) {
            return "redirect:/tickets";
        }

        Optional<User> userRepoByEmail = userRepo.findByEmail(email);
        if (userRepoByEmail.isEmpty()) {
            return "redirect:/";
        }

        User user = userRepoByEmail.get();
        if (!user.getPassword().equals(password)) {
            return "redirect:/";
        }
        sessionStorage.setUser(user);
        return "redirect:/tickets";
    }

    @GetMapping("/logout")
    public String logout() {
        sessionStorage.logout();
        return "redirect:/";
    }

}

