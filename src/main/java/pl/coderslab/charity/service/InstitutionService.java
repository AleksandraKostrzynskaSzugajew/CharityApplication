package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class InstitutionService {

    private final InstitutionRepository institutionRepository;

    public InstitutionService(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    public List<Institution> findAll() {
        return institutionRepository.findAll();
    }

    public boolean save(Institution institution) {
        if (institutionRepository.findByKrs(institution.getKrs()) == null
                && institutionRepository.findByName(institution.getName()) == null) {
            institutionRepository.save(institution);
            return true;
        }
        return false;
    }

    public boolean edit(Institution institution) {
        Institution existingByKrs = institutionRepository.findByKrs(institution.getKrs());
        Institution existingByName = institutionRepository.findByName(institution.getName());

        // Sprawdź, czy instytucja o danym numerze KRS lub nazwie już istnieje
        if ((existingByKrs == null || existingByKrs.getId().equals(institution.getId())) &&
                (existingByName == null || existingByName.getId().equals(institution.getId()))) {

            // Sprawdź, czy existingByKrs nie jest null przed wywołaniem equals
            if (existingByKrs != null && existingByKrs.equals(institution)) {
                return true;
            }

            // Sprawdź, czy existingByName nie jest null przed wywołaniem equals
            if (existingByName != null && existingByName.equals(institution)) {
                return true;
            }

            // Zaktualizuj instytucję, jeśli zmiany zostały wprowadzone
            institutionRepository.save(institution);
            return true;
        }
        return false;
    }



    public void deleteById(Long id) {
        Optional<Institution> institution = institutionRepository.findById(id);
        institutionRepository.delete(institution.get());
    }

    public Institution findById(Long id) {
        return institutionRepository.findById(id).get();
    }
}
