package pl.coderslab.charity.Controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.service.AdminService;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.RoleService;
import pl.coderslab.charity.service.UserService;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {


    private final UserService userService;
    private final AdminService adminService;
    private final RoleService roleService;
    private final DonationService donationService;

    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public UserController(UserService userService, AdminService adminService, RoleService roleService, DonationService donationService, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userService = userService;
        this.adminService = adminService;
        this.roleService = roleService;
        this.donationService = donationService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @ModelAttribute("users")
    public List<User> admins() {
        return adminService.findAllAdmins(2L);
    }


    @GetMapping("/findall")
    public String findAllUsersView() {
        return "user/findAll";
    }


    @GetMapping("/edit")
    public String edit(Model model, @RequestParam Long id) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "user/edit";
    }

    @PostMapping("/edit")
    public String edited(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userService.edit(user);
        return "user/findAll";
    }

    @GetMapping("/editbu")
    public String editByUser(Model model) {
        Long userId = userService.getCurrentUser();
        User user = userService.findById(userId);
        model.addAttribute("user", user);
        return "user/editByUser";
    }

    @PostMapping("/editbu")
    public String editedByUser(@RequestParam Long id,
                               @RequestParam String email,
                               @RequestParam String name) {
        User user = userService.findById(id);
        user.setEmail(email);
        user.setName(name);
        userService.edit(user);
        return "user/data-actualized";
    }


    @GetMapping("/remove")
    public String remove(@RequestParam Long id) {
        userService.deleteById(id);
        return "user/findAll";
    }

    @GetMapping("/block")
    public String block(@RequestParam long id) {
        userService.blockUser(id);
        return "user/findAll";
    }

    @GetMapping("/unblock")
    public String unblock(@RequestParam long id) {
        userService.unblockUser(id);
        return "user/findAll";
    }

    @GetMapping("/mydonations")
    public String listMyDonations(Model model, @RequestParam(value = "sort", required = false) String sort) {
        List<Donation> myDonations = donationService.findAllDonations(userService.getCurrentUser());

        if (sort != null) {
            switch (sort) {
                case "Sortuj według statusu odebrania":
                    Collections.sort(myDonations, Comparator.comparing(Donation::isPickedUp));
                    break;
                case "Sortuj według daty odebrania":
                    Collections.sort(myDonations, Comparator.comparing(Donation::getPickUpDate));
                    break;
                case "Sortuj według daty utworzenia wpisu":
                    Collections.sort(myDonations, Comparator.comparing(Donation::getDonationDeclaredOn));
                    break;
                default:
                    Collections.sort(myDonations, Comparator.comparing(Donation::getId));
            }
        }

        model.addAttribute("myDonations", myDonations);
        return "user/my-donations";
    }


}
