package com.proyecto.daw.service;

import com.proyecto.daw.model.Review;
import com.proyecto.daw.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ReviewService {
    @Autowired
    private ReviewRepository reviewRepository;

    public List<Review> obtenerResenasActivas() {
        return reviewRepository.findByActivaTrue();
    }

    public List<Review> findAll(){return reviewRepository.findAll(); }

    @Transactional
    public Review cambiarVisibilidad (int id){
        Review resena = reviewRepository.findById(id).orElseThrow(()-> new IllegalArgumentException("Reseña no encontrada con ID " + id));

        resena.setActiva(!resena.getActiva());
        return reviewRepository.save(resena);
    }
}