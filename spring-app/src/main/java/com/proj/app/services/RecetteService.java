package com.proj.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.proj.app.entities.DetailRecette;
import com.proj.app.entities.Recette;
import com.proj.app.repositories.DetailRecetteRepository;
import com.proj.app.repositories.RecetteRepository;

@Service
public class RecetteService 
{
    @Autowired
    private RecetteRepository recetteRepo;

    @Autowired
    private DetailRecetteRepository detailRecetteRepo;


    public List<Recette> getAll() {
        return this.recetteRepo.findAll();
    }

    public Recette getRecetteById(Long id) {
        return this.recetteRepo.findById(id)
         .orElseThrow(()->new RuntimeException("Recette introuvable !"));
    }

    public void ajouterRecette(Recette recette) {
        this.recetteRepo.save(recette);
    }

    public void ajouterDetailRecette(DetailRecette detail) {
        this.detailRecetteRepo.save(detail);
    }

}
