package pl.coderslab.charity.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.email.EmailServiceImpl;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.service.CategoryService;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;
import pl.coderslab.charity.service.UserService;

import java.time.LocalDate;
import java.util.List;

@Controller
public class DonationController {

    private final InstitutionService institutionService;
    private final CategoryService categoryService;
    private final DonationService donationService;
    private final UserService userService;
    private final EmailServiceImpl emailServiceImpl;

    public DonationController(InstitutionService institutionService, CategoryService categoryService, DonationService donationService, UserService userService, EmailServiceImpl emailServiceImpl) {
        this.institutionService = institutionService;
        this.categoryService = categoryService;
        this.donationService = donationService;
        this.userService = userService;
        this.emailServiceImpl = emailServiceImpl;
    }

    @GetMapping("/home/donate")
    public String getCategories(Model model) {
        List<Category> categories = categoryService.findAll();
        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("categories", categories);
        model.addAttribute("institutions", institutions);
        model.addAttribute("donation", new Donation());
        Long userId = userService.getCurrentUser();
        model.addAttribute("userId", userId);
        return "form";
    }


    @PostMapping("/donated")
    public String processDonationForm(@ModelAttribute("donation") Donation donation) {
        donation.setDonationDeclaredOn(LocalDate.now());
        donation.setPickedUp(false);
        donationService.save(donation);
        donationService.sendDonationConfirmingEmail(donation);
        return "form-confirmation";
    }
}
