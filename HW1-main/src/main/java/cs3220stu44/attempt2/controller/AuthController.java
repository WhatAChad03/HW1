package cs3220stu44.attempt2.controller;

import cs3220stu44.attempt2.DataStorage;
import cs3220stu44.attempt2.SessionStorage;
import cs3220stu44.attempt2.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {
    private final DataStorage dataStorage;
    private final SessionStorage sessionStorage;

    public AuthController(DataStorage dataStorage, SessionStorage sessionStorage) {
        this.dataStorage = dataStorage;
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
        User user = dataStorage.authenticate(email, password);
        if (user != null) {
            sessionStorage.setUser(user);
            sessionStorage.setLoggedIn(true);
            return "redirect:/tickets";
        } else {
            return "redirect:/login?error";
        }
    }

    @GetMapping("/logout")
    public String logout() {
        sessionStorage.logout();
        return "redirect:/";
    }
}

