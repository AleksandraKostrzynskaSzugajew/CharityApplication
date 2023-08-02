package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.charity.entity.Contact;
import pl.coderslab.charity.repository.ContactRepository;

@Service
@Transactional
public class ContactService {

    private final ContactRepository contactRepository;


    public ContactService(ContactRepository contactRepository) {
        this.contactRepository = contactRepository;
    }

    public void save(Contact contact) {
        contactRepository.save(contact);
    }
}
