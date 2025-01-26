package org.example.e_commerce_web_application_assignment_01.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class User {
    private int user_id;
    private String name;
    private String userName;
    private String email;
    private String role;
    private String password;
    @Setter
    @Getter
    private String imagePath;

    public User(int user_id, String userName, String password, String email, int role, String s) {
        this.userName = userName;
        this.password = password;
    }

    /*private String password;*/
}
