package com.proyecto.daw.controller;

import com.proyecto.daw.model.Review;
import com.proyecto.daw.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/comunidad")
public class CommunityController {
    @Autowired
    private ReviewService reviewService;


    @GetMapping("/resenas")
    public List<Review> getResenas() {
        return reviewService.obtenerResenasActivas();
    }

    @GetMapping("/resenas/todas")
    public ResponseEntity<List<Review>> obtenerTodasResenias(){
        return  ResponseEntity.ok(reviewService.findAll());
    }

    @PatchMapping("/resenas/{id}/cambiar-visibilidad")
    public ResponseEntity<?> cambiarVisibilidad(@PathVariable int id){
        try {
            Review resenaActualizada = reviewService.cambiarVisibilidad(id);
            return ResponseEntity.ok(resenaActualizada);
        } catch (IllegalArgumentException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("error", e.getMessage()));
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", "Error interno al cambiar la visibilidad de la reseña."));
        }
    }
}
