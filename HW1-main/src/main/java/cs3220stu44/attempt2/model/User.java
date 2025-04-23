package cs3220stu44.attempt2.model;
import jakarta.persistence.*;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private static int next = 1;
    private int id;
    private String name;
    private String email;
    private String phone;
    private String password;

    public User(int id, String name, String email, String password) {
        this.id = next++;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.password = password;
    }

    @Enumerated(EnumType.STRING)
    private Role role;

    public enum Role {
        USER, TECHNICIAN
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

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

