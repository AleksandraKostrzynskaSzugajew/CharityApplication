package pl.coderslab.charity.security;

import jakarta.servlet.DispatcherType;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SesSecurityConfig {


    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {


        http.authorizeHttpRequests((authorize) -> authorize
                        .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                // ... the rest of your authorization rules

        );
        http

                // jak dwie gwiazdki to przepuszcza tez podkatalog
                // * pojedyncze zaglebienie
                //** zaglebien dowolna ilosc

                .authorizeHttpRequests((requests) -> requests
                                .requestMatchers("/css/**", "/js/**",
                                        "/home/**",
                                        "/images/**", "/home/login/**", "/home/register/**", "/home/donate/**", "/donated/**").permitAll()
//                        .requestMatchers("/user/**").hasAnyRole("USER", "ADMIN")
//                        "/", "/home/**", "/home/register", "/home/logout", "/home/login", "/css/**", "/js/**", "/images/**"

                        .requestMatchers("/admin/**").hasRole("ADMIN")
                                .anyRequest().authenticated()
                )
                .formLogin((form) -> form
                        .loginPage("/home/login")
                        .loginProcessingUrl("/home/login")
                        .permitAll()
                        .usernameParameter("email")
                        .defaultSuccessUrl("/home") // Domyślna strona dla użytkownika

                )
                .logout((logout) -> logout.logoutUrl("/logout").logoutSuccessUrl("/login")
                        .invalidateHttpSession(true).deleteCookies("JSESSIONID").permitAll());


        return http.build();

    }


}