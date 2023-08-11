package pl.coderslab.charity.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;


@Entity
@NoArgsConstructor
@Data
@ToString
public class Institution {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String description;

    @NotEmpty(message = "Numer KRS nie może być pusty")
    @Pattern(regexp = "\\d{10}", message = "Numer KRS musi składać się z 10 cyfr")
    private String krs;
}
