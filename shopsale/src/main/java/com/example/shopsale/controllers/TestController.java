package com.example.shopsale.controllers;

import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author DMoroz
 **/
public class TestController {
    @GetMapping("/test-image")
    public String testImage() {
        return "test-image";
    }
}
