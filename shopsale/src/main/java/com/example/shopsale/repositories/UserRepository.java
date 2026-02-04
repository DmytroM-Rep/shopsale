package com.example.shopsale.repositories;

import com.example.shopsale.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author DMoroz
 **/
public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
