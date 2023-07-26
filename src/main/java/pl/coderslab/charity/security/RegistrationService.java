package pl.coderslab.charity.security;

import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class RegistrationService {

    public String generateUniqueToken() {
        return UUID.randomUUID().toString();
    }
}
