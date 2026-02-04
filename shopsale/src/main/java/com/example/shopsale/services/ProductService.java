package com.example.shopsale.services;

import com.example.shopsale.models.Image;
import com.example.shopsale.models.Product;
import com.example.shopsale.models.User;
import com.example.shopsale.repositories.ProductRepository;
import com.example.shopsale.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jspecify.annotations.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

/**
 * @author DMoroz
 **/
@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {

    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    private List<Product> products = new ArrayList<>();

    public List<Product> getProducts(String title) {
        if(title != null) return productRepository.findByTitle(title);
        return productRepository.findAll();
    }

    public void saveProduct(Principal principal, Product product, MultipartFile img1, MultipartFile img2, MultipartFile img3) throws IOException {
        product.setUser(getUserByPrincipal(principal));
        Image file1;
        Image file2;
        Image file3;
        if(img1 != null) {
            file1 = convertToImage(img1);
            file1.setPreviewImage(true);
            product.addImageToProducts(file1);
        }
        if(img2 != null) {
            file2 = convertToImage(img2);
            product.addImageToProducts(file2);
        }
        if(img3 != null) {
            file3 = convertToImage(img3);
            product.addImageToProducts(file3);
        }
        log.info("Product saved. Title: {}", product.getTitle());

        Product dbProduct = productRepository.save(product);
        dbProduct.setPreviewImageId(dbProduct.getImages().get(0).getId());
        productRepository.save(product);
    }

    public User getUserByPrincipal(Principal principal) {
        if(principal == null) return null;
        return userRepository.findByEmail(principal.getName());
    }

    private Image convertToImage(MultipartFile img) throws IOException {
        Image image = new Image();
        image.setName(image.getName());
        image.setFileName(img.getOriginalFilename());
        image.setContentType(img.getContentType());
        image.setSize(img.getSize());
        image.setBytes(img.getBytes());
        return image;
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }
}
