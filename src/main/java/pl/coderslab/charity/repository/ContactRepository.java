package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.entity.Contact;

public interface ContactRepository extends JpaRepository<Contact, Long> {
}
