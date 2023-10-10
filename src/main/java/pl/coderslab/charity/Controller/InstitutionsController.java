package pl.coderslab.charity.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.service.InstitutionService;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
@RequestMapping("/admin/inst")
public class InstitutionsController {

    private final InstitutionService institutionService;

    public InstitutionsController(InstitutionService institutionService) {
        this.institutionService = institutionService;
    }

    // private static final Logger logger = LoggerFactory.getLogger(InstitutionsController.class);


    @ModelAttribute("institutions")
    public List<Institution> institutions() {
        return institutionService.findAll();
    }

    @GetMapping("/findall")
    public String findAll() {
        return "institution/findAll";
    }

    @GetMapping("/save")
    public String save(Model model) {
        model.addAttribute("institution", new Institution());
        return "institution/save";
    }

    @PostMapping("/save")
    public String saved(@ModelAttribute Institution institution, Model model) throws UnsupportedEncodingException {
        if (institutionService.save(institution)) {
            return "redirect:/institution/findAll";
        } else {
            model.addAttribute("errorMessage", "Instytucja o podanej nazwie lub numerze KRS już istnieje.");
            return "institution/save";
        }
    }


    @GetMapping("/edit")
    public String edit(Model model, @RequestParam Long id) {
        Institution institution = institutionService.findById(id);
        model.addAttribute("institution", institution);
        return "institution/edit";
    }

    @PostMapping("/edit")
    public String edited(Institution institution, Model model) {
        if (institutionService.edit(institution)) {
            return "redirect:/institution/findAll";
        } else {
            model.addAttribute("errorMessage", "Instytucja o podanej nazwie lub numerze KRS już istnieje.");
            return "institution/edit";
        }
    }


    @GetMapping("/remove")
    public String remove(@RequestParam Long id) {
        institutionService.deleteById(id);
        return "redirect:findall";
    }
}
