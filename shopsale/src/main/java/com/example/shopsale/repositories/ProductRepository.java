package com.example.shopsale.repositories;

import com.example.shopsale.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author DMoroz
 **/
public interface ProductRepository extends JpaRepository<Product, Long> {

    List<Product> findByTitle(String title);
}
