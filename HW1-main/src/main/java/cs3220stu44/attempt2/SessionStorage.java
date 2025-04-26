package cs3220stu44.attempt2;

import cs3220stu44.attempt2.model.User;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SessionStorage {
    private User currentUser; //logged in user
    private boolean loggedIn;

    public User getUser() {return currentUser;}

    public void setUser(User currentUser) {
        this.currentUser = currentUser;
        this.loggedIn = true;
    }

    public boolean isLoggedIn() {return loggedIn;}

    public void logout() {
        this.currentUser = null;
        this.loggedIn = false;
    }
}