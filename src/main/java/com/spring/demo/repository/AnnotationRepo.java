package com.spring.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.demo.model.Annotation;

public interface AnnotationRepo extends JpaRepository<Annotation, Integer>{
    
}
