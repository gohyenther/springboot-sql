package com.spring.demo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.spring.demo.model.Annotation;
import com.spring.demo.service.AnnotationService;

@RestController
@RequestMapping("/annotation")
@CrossOrigin
public class AnnotationController {

    @Autowired
    AnnotationService annotationService;

    // ------------- POST REQUESTS --------------- //
    @PostMapping("/add/{id}")
    @ResponseStatus(code = HttpStatus.CREATED)
    public String addAnnotationById(@RequestBody String xfdfString, @PathVariable int id) {
        Annotation annotation = new Annotation();
        annotation.setId(id);
        annotation.setString(xfdfString);
        
        annotationService.saveAnnotation(annotation);
        return "New annotation saved!";
    }

    
    // ------------- GET REQUESTS --------------- //
    @GetMapping("/getAll")
    public List<Annotation> getAllAnnotations() {
        return annotationService.getAllAnnotations();
    }

    @GetMapping("/get/{id}")
    public Optional<Annotation> getAnnotationById(@PathVariable int id) {
        return annotationService.getAnnotationById(id);
    }
    
}
