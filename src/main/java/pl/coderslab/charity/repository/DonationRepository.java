package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;

import java.util.List;

public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query("SELECT COALESCE(SUM(d.quantity), 0) FROM Donation d")
    Integer sumQuantity();

    @Query("SELECT COUNT(d) FROM Donation d")
    Long countDonations();

    List<Donation> findAllByUserId(Long userId);

}
