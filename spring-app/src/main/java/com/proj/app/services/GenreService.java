package com.proj.app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.app.entities.Genre;
import com.proj.app.repositories.GenreRepository;

@Service
public class GenreService 
{
    @Autowired
    private GenreRepository genreRepo;
    
    public Genre getById(Long id) {
        return this.genreRepo.findById(id)
            .orElseThrow(() -> new RuntimeException("Ingrédient introuvable"));
    }
}
