package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.repository.DonationRepository;

@Service
@Transactional
public class DonationService {

    private final DonationRepository donationRepository;
    private final UserService userService;

    public DonationService(DonationRepository donationRepository, UserService userService) {
        this.donationRepository = donationRepository;
        this.userService = userService;
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
}
