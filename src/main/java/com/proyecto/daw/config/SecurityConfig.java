package com.proyecto.daw.config;

import com.proyecto.daw.service.CustomUserDetailsService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final CustomUserDetailsService customUserDetailsService;

    public SecurityConfig(CustomUserDetailsService customUserDetailsService) {
        this.customUserDetailsService = customUserDetailsService;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .cors(cors -> cors.configurationSource(corsConfigurationSource()))
                .csrf(csrf -> csrf.disable()) // Deshabilitado para peticiones desde React
                .sessionManagement(session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED))
                .authorizeHttpRequests(auth -> auth
                        
                        .requestMatchers("/h2-console/**").hasRole("ADMIN")
                        .requestMatchers("/contacto/todos/**", "/contacto/todos").hasRole("ADMIN")
                        .requestMatchers("/solicitudes/todas", "/usuario/count").hasRole("ADMIN")
                        .requestMatchers(HttpMethod.GET, "/usuario", "/comunidad/resenas/todas").hasRole("ADMIN")
                        .requestMatchers(HttpMethod.PUT, "/solicitudes/**", "/donaciones/**").hasRole("ADMIN")
                        .requestMatchers(HttpMethod.PATCH, "/donaciones/**", "/solicitudes/**", "/comunidad/resenas/**", "/usuarios/**").hasRole("ADMIN")
                        .requestMatchers(HttpMethod.DELETE, "/donaciones/**", "/solicitudes/**", "/usuario/**").hasRole("ADMIN")
                        
                     
                        .requestMatchers(HttpMethod.POST, "/productos/**").hasRole("ADMIN")
                        .requestMatchers(HttpMethod.PUT, "/productos/**").hasRole("ADMIN")
                        .requestMatchers(HttpMethod.DELETE, "/productos/**").hasRole("ADMIN")

                       
                        .requestMatchers("/auth/**", "/usuario/login", "/contacto", "/donar", "/perfil/**").permitAll()
                        .requestMatchers(HttpMethod.POST, "/usuario").permitAll()
                        .requestMatchers(HttpMethod.GET, "/comunidad/resenas", "/donaciones/ranking", "/donaciones/ultima", "/solicitudes/entregadas/count").permitAll()
                        .requestMatchers(HttpMethod.GET, "/productos/**", "/images/**").permitAll()
                        .requestMatchers("/terminos", "/ranking").permitAll()

                        
                        .requestMatchers(HttpMethod.PUT, "/usuario").authenticated()
                        .requestMatchers("/auth/check", "/usuario/perfil", "/usuario/cambiar-password", "/usuario/update-password").authenticated()
                        .requestMatchers("/solicitudes/**", "/donaciones/**", "/donation-states/**").authenticated()
                        .requestMatchers(HttpMethod.GET, "/usuario/**").authenticated() 

                     
                        .anyRequest().authenticated())

                .headers(headers -> headers.frameOptions(frame -> frame.sameOrigin()));
                //.httpBasic(Customizer.withDefaults());

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        
        configuration.setAllowedOriginPatterns(Arrays.asList("http://localhost*"));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS"));
        configuration.setAllowedHeaders(Arrays.asList("Authorization", "Content-Type"));
        configuration.setAllowCredentials(true);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}