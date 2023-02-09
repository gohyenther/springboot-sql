package com.spring.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.demo.model.Annotation;
import com.spring.demo.repository.AnnotationRepo;

@Service
public class AnnotationServiceImpl implements AnnotationService{

    @Autowired
    private AnnotationRepo annotationRepo;

    @Override
    public Annotation saveAnnotation(Annotation annotation) {
        return annotationRepo.save(annotation);
    }

    @Override
    public List<Annotation> getAllAnnotations() {
        return annotationRepo.findAll();
    }

    @Override
    public Optional<Annotation> getAnnotationById(int id) {
        return annotationRepo.findById(id);
    }

}
