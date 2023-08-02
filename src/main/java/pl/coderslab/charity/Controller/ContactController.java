package pl.coderslab.charity.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.entity.Contact;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.service.ContactService;
import pl.coderslab.charity.service.UserService;

import java.util.Optional;

@Controller
public class ContactController {

    private final ContactService contactService;
    private final UserService userService;

    public ContactController(ContactService contactService, UserService userService) {
        this.contactService = contactService;
        this.userService = userService;
    }

    @PostMapping("/contact")
    public String contactByFormFromFooter(@RequestParam String name,
                                          @RequestParam String surname,
                                          @RequestParam String message,
                                          @RequestParam String email) {

        Contact contact = new Contact();
        contact.setName(name);
        contact.setSurname(surname);
        contact.setEmail(email);
        contact.setMessage(message);
        contact.setManaged(false);
        contact.setUserId(userService.getCurrentUser());

        contactService.save(contact);

        return "/home";
    }


}
