package com.example.shopsale.controllers;

import com.example.shopsale.models.Product;
import com.example.shopsale.models.User;
import com.example.shopsale.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

/**
 * @author DMoroz
 **/
@Controller
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;

    @GetMapping("/")
    public String products(@RequestParam(name = "searchWord", required = false) String title, Model model, Principal principal) {
        model.addAttribute("products", productService.getProducts(title));
        User user = productService.getUserByPrincipal(principal);
        if (user != null) {
            model.addAttribute("user", user);
        }
        model.addAttribute("searchWord", title);
        return "products";
    }

    @PostMapping("/product/create")
    public String createProduct(Principal principal, Product product,
                                @RequestParam("file1") MultipartFile file1,
                                @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3) throws IOException {
        productService.saveProduct(principal, product, file1, file2, file3);
        return "redirect:/user/products";
    }

    @GetMapping("/product/{id}")
    public String viewProduct(@PathVariable Long id, Model model, Principal principal) {
        Product product = productService.getProductById(id);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        model.addAttribute("authorProduct", product.getUser());
        return "productView";
    }

    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "redirect:/";
    }

    @GetMapping("/user/products")
    public String getUserProducts(Model model, Principal principal) {
        User user = productService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("products", user.getProducts());
        return "userProducts";
    }
}
