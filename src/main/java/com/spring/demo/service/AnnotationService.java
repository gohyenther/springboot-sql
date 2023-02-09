package com.spring.demo.service;

import java.util.List;
import java.util.Optional;

import com.spring.demo.model.Annotation;

public interface AnnotationService {
    public Annotation saveAnnotation(Annotation student);
    public List<Annotation> getAllAnnotations();
    public Optional<Annotation> getAnnotationById(int id);
}
