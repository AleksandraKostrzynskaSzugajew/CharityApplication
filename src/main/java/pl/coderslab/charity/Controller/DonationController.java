package pl.coderslab.charity.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.service.CategoryService;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;
import java.util.List;

@Controller
public class DonationController {

    private final InstitutionService institutionService;
    private final CategoryService categoryService;
    private final DonationService donationService;

    public DonationController(InstitutionService institutionService, CategoryService categoryService, DonationService donationService) {
        this.institutionService = institutionService;
        this.categoryService = categoryService;
        this.donationService = donationService;
    }

    @GetMapping("/donate")
    public String getCategories(Model model) {
        List<Category> categories = categoryService.findAll();
        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("categories", categories);
        model.addAttribute("institutions", institutions);
        model.addAttribute("donation", new Donation());

        return "form";
    }

//    @PostMapping("/donated")
//    public String saveDonation(@RequestParam int quantity,
//                               @RequestParam List<Category> categories,
//                               @RequestParam List<Institution> institutions,
//                               @RequestParam String street,
//                               @RequestParam String city,
//                               @RequestParam String zipCode,
//                               @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate pickUpDate,
//                               @RequestParam LocalTime pickUpTime,
//                               @RequestParam String pickUpComment,
//                               @RequestParam String phone) {
//
//        Donation donation = new Donation();
//        donation.setQuantity(quantity);
//        donation.setCategories(categories);
//        donation.setInstitutions(institutions);
//        donation.setStreet(street);
//        donation.setCity(city);
//        donation.setZipCode(zipCode);
//        donation.setPickUpDate(pickUpDate);
//        donation.setPickUpTime(pickUpTime);
//        donation.setPickUpComment(pickUpComment);
//        donation.setPhone(phone);
//        donationService.save(donation);
//
//        return "form-confirmation";
//    }


    @PostMapping("/donated")
    public String processDonationForm(@ModelAttribute("donation") Donation donation) {
        // Przetwarzanie obiektu Donation

        donationService.save(donation);
        System.out.println("========================================");
        System.out.println("city = " +donation.getCity());
        return "form-confirmation";
    }
}
