package pl.coderslab.charity.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;
import pl.coderslab.charity.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/home")
public class HomePageController {

    private final InstitutionService institutionService;
    private final DonationService donationService;

    private final UserService userService;

    public HomePageController(InstitutionService institutionService, DonationService donationService, UserService userService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
        this.userService = userService;
    }

    @GetMapping
    public String homePage(Model model) {
        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("institutions", institutions);

        int numberOfSacks = donationService.numberOfDonatedSacks();
        model.addAttribute("numberOfSacks", numberOfSacks);

        Long numberOfDonations = donationService.countDonations();
        model.addAttribute("numberOfDonations", numberOfDonations);

        return "home";
    }

    @GetMapping("/about")
    public String aboutUs() {
        return "aboutUs";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("user", new User());

        return "register";
    }

    @PostMapping("/register")
    public String registered(@ModelAttribute User user) {
        System.out.println("================================================================================");
        System.out.println(user.getEmail());
        userService.save(user);
        return "home";
    }

}
