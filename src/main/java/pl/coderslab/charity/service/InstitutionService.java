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

    public void save(Institution institution) {
        institutionRepository.save(institution);
    }

    public void edit(Institution institution) {
        institutionRepository.save(institution
        );
    }

    public void deleteById(Long id) {
        Optional<Institution> institution = institutionRepository.findById(id);
        institutionRepository.delete(institution.get());
    }

    public Institution findById(Long id) {
        return institutionRepository.findById(id).get();
    }
}
