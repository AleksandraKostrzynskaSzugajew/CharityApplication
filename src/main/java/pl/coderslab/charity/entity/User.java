package pl.coderslab.charity.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Entity
@Data
@ToString
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

//    private String name;
//    private String surname;
    private String email;
    private String password;

    @ManyToOne
    private Role role;

    @Column(columnDefinition = "boolean default false")
    private boolean enabled;

    private String comment;

    private String name;
}
