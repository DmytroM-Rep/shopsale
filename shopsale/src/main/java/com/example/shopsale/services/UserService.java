package com.example.shopsale.services;

import com.example.shopsale.models.User;
import com.example.shopsale.models.enums.Role;
import com.example.shopsale.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author DMoroz
 **/
@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public boolean createUser(User user) {
        String userEmail = user.getEmail();
        if (userRepository.findByEmail(userEmail) != null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);
        userRepository.save(user);
        log.info("User created successfully {}", user.getEmail());
        return true;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @PostMapping("/user/blocked/{id}")
    public void userBlocked(Long userId) {
        User user = userRepository.findById(userId).orElse(null);
        if (user != null){
            if (user.isActive()){
                user.setActive(false);
                log.info("User blocked successfully {}", user.getEmail());
            } else {
                user.setActive(true);
                log.info("User unblocked successfully {}", user.getEmail());
            }
        }
        userRepository.save(user);
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values()).map(Role::name).collect(Collectors.toSet());
        user.getRoles().clear();
        for (String roleKey : form.keySet()) {
            if (roles.contains(roleKey)) {
                user.getRoles().add(Role.valueOf(roleKey));
            }
        }
        userRepository.save(user);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
}
