package pl.coderslab.charity.Controller;

import org.apache.tomcat.jni.Local;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.service.CategoryService;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;

import java.time.LocalDate;
import java.time.LocalTime;
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

    @GetMapping("/categories")
    public String getCategories(Model model) {
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);

        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("institutions", institutions);


        model.addAttribute("donation", new Donation());

        return "form";
    }

    @PostMapping("/categories")
    public String saveDonation(@RequestParam int quantity,
                               @RequestParam List<Category> categories,
                               @RequestParam List<Institution> institutions,
                               @RequestParam String street,
                               @RequestParam String city,
                               @RequestParam String zipCode,
                               @RequestParam LocalDate pickUpDate,
                               @RequestParam LocalTime pickUpTime,
                               @RequestParam String pickUpComment,
                               @RequestParam String phone) {
        Donation donation = new Donation();
        donation.setQuantity(quantity);
        donation.setCategories(categories);
        donation.setInstitutions(institutions);
        donation.setStreet(street);
        donation.setCity(city);
        donation.setZipCode(zipCode);
        donation.setPickUpDate(pickUpDate);
        donation.setPickUpTime(pickUpTime);
        donation.setPickUpComment(pickUpComment);
        donation.setPhone(phone);
        donationService.save(donation);

        return "form";
    }


}
