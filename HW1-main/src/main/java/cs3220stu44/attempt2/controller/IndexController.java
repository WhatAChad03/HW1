package cs3220stu44.attempt2.controller;

import cs3220stu44.attempt2.SessionStorage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
    private final SessionStorage sessionStorage;

    public IndexController(SessionStorage sessionStorage) {
        this.sessionStorage = sessionStorage;
    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("loggedIn", sessionStorage.isLoggedIn());
        model.addAttribute("user", sessionStorage.getUser());

        return "redirect:/login";
    }
}