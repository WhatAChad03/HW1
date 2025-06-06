package cs3220stu44.attempt2.model;
import jakarta.persistence.*;

@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String email;
    private String password;
    private boolean technician;

    public User() {}

    public User(String name, String email, String password, boolean technician) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.technician = technician;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isTechnician() {
        return technician;
    }

    public void setTechnician(boolean technician) {
        this.technician = technician;
    }
}

