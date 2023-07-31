package pl.coderslab.charity.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.email.EmailServiceImpl;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.security.RegistrationService;
import pl.coderslab.charity.service.*;

import java.util.List;

@Controller
@RequestMapping("/home")
public class HomePageController {

    private final InstitutionService institutionService;
    private final DonationService donationService;

    private final UserService userService;
    private final RoleService roleService;
    private final AdminService adminService;

    private final RegistrationService registrationService;

    private final EmailServiceImpl emailServiceImpl;

    public HomePageController(InstitutionService institutionService, DonationService donationService, UserService userService, RoleService roleService, AdminService adminService, RegistrationService registrationService, EmailServiceImpl emailServiceImpl) {
        this.institutionService = institutionService;
        this.donationService = donationService;
        this.userService = userService;
        this.roleService = roleService;
        this.adminService = adminService;
        this.registrationService = registrationService;
        this.emailServiceImpl = emailServiceImpl;
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

    @GetMapping("/admin")
    public String adminHomePage() {
        return "adminView/adminHomePage";
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


    //TODO wygasniecie tokenu po 24h

    @PostMapping("/register")
    public String registered(@ModelAttribute User user) {

        System.out.println("================================================================================");
        System.out.println(userService.findByEmail(user.getEmail()));
        if (userService.findByEmail(user.getEmail()) == -1) {
            user.setRole(roleService.findByName("ROLE_USER"));
            String token = registrationService.generateUniqueToken();
            user.setUniqueToken(token);
            userService.save(user);
            userService.sendActivationEmail(user);

            return "after-registration";
        } else {
            return "user-in-db";
        }
    }

    @GetMapping("/activate")
    public String activateAccount(@RequestParam String token) {
        User user = userService.findByUniqueToken(token);

        if (user != null) {
            // Aktywuj konto użytkownika
            user.setEnabled(true);
            userService.edit(user);
            System.out.println("==============================================================================");
            System.out.println("activated");
            return "user/activated"; // Zwraca widok z potwierdzeniem aktywacji konta


        } else {
            // Token jest nieprawidłowy lub wygasł
            return "invalidToken"; // Zwraca widok z komunikatem o nieprawidłowym lub wygasłym tokenie
        }
    }

    @GetMapping("/resetpass")
    public String resetPasswordView() {
        return "user/resetpass";
    }

    @PostMapping("/resetpass")
    public String resetPassword(@RequestParam String email) {
        userService.resetPass(email);
        return "/home";
    }

    @GetMapping("/resetpassfm")
    public String showResetForm(@RequestParam String token) {

        User user = userService.findByResetToken(token);
        if (user != null) {
            user.setResetToken("");
            userService.edit(user);
            return "user/resetpassfrommail";
        } else return "user/noSuchUser";
    }

    @PostMapping("/resetpassfm")
    public String resetForm(@RequestParam String password1,
                            @RequestParam String password2,
                            @RequestParam Long id) {

        User user = userService.findById(id);

        String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";

        if (password1.equals(password2) && password1.matches(passwordRegex)) {
            user.setPassword(password1);
            userService.edit(user);
        }
        return "login";
    }


}
