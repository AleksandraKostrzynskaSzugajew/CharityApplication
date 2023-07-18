package pl.coderslab.charity.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;

import java.util.List;

@Controller
public class HomePageController {

    private final InstitutionService institutionService;
    private final DonationService donationService;

    public HomePageController(InstitutionService institutionService, DonationService donationService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
    }


    @GetMapping("/home")
    public String allInstitutions(Model model) {
        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("institutions", institutions);

        int numberOfSacks = donationService.numberOfDonatedSacks();
        model.addAttribute("numberOfSacks", numberOfSacks);

        Long numberOfDonations = donationService.countDonations();
        model.addAttribute("numberOfDonations", numberOfDonations);

        return "index";
    }
}
