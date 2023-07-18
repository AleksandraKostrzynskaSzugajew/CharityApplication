package pl.coderslab.charity.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Entity
@NoArgsConstructor
@Data
@ToString
public class Donation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int quantity;

    @OneToMany
    private List<Category> categories;

    @OneToMany
    private List<Institution> institutions;

    private String street;
    private String city;
    private String zipCode;

    private LocalDate pickUpDate;
    private LocalTime pickUpTime;


    private String pickUpComment;

    private String phone;

}