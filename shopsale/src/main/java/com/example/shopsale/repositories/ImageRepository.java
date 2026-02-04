package com.example.shopsale.repositories;

import com.example.shopsale.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author DMoroz
 **/
public interface ImageRepository extends JpaRepository<Image, Long> {
}
