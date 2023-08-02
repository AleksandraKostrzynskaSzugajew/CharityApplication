package pl.coderslab.charity.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.DonationRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class DonationService {

    private final DonationRepository donationRepository;
    private final UserService userService;
    private final JavaMailSender javaMailSender;

    public DonationService(DonationRepository donationRepository, UserService userService, JavaMailSender javaMailSender) {
        this.donationRepository = donationRepository;
        this.userService = userService;
        this.javaMailSender = javaMailSender;
    }

    public int numberOfDonatedSacks() {
        return donationRepository.sumQuantity();
    }

    public Long countDonations() {
        return donationRepository.countDonations();
    }

    public void save(Donation donation) {

        Long userId = userService.getCurrentUser();

        if (userId != null) {
            donation.setUserId(userId);
            donationRepository.save(donation);
        } else {
            donation.setUserId(1L);
            donationRepository.save(donation);
        }

    }

    public List<Donation> findAllDonations(Long id) {
        return donationRepository.findAllByUserId(id);
    }

    @Async
    public void sendDonationConfirmingEmail(Donation donation) {
        User user = userService.findById(userService.getCurrentUser());
        SimpleMailMessage message = new SimpleMailMessage();
        String subject = "Potwierdzenie zadeklarowanej donacji";
        String to = user.getEmail();

        String categoriesString = donation.getCategories().stream()
                .map(Category::getName)
                .collect(Collectors.joining(", "));

        String body = String.format(
                "Witaj %s,\n\n" +
                        "dziękujemy za Twoją zadeklarowaną donację!\n\n" +
                        "Szczegóły donacji:\n" +
                        "Ilość 60l worków: %d\n" +
                        "Kategorie oddawanych rzeczy: %s\n" +
                        "Instytucja: %s\n" +
                        "Adres odbioru: %s, %s %s\n" +
                        "Data odbioru: %s\n" +
                        "Godzina odbioru: %s\n" +
                        "Telefon kontaktowy: %s\n\n" +
                        "Dodatkowy komentarz: %s\n\n" +
                        "Dziękujemy za wsparcie!\n\n" +
                        "Zespół CharityApp",
                user.getName(),
                donation.getQuantity(),
                categoriesString,
                donation.getInstitution().getName(),
                donation.getStreet(),
                donation.getCity(),
                donation.getZipCode(),
                donation.getPickUpDate(),
                donation.getPickUpTime(),
                donation.getPhone(),
                donation.getPickUpComment()
        );

        message.setText(body);
        message.setTo(to);
        message.setSubject(subject);

        javaMailSender.send(message);
    }
}
