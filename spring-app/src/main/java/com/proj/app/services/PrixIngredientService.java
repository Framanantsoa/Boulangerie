package com.proj.app.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.proj.app.entities.*;
import com.proj.app.repositories.PrixIngredientRepository;

@Service
public class PrixIngredientService 
{
    @Autowired
    private PrixIngredientRepository prixIngredientRepo;

    public PrixIngredient getById(Long id) {
        return prixIngredientRepo.findById(id)
         .orElseThrow(() -> new RuntimeException("Prix de l'ingrédient introuvable !"));
    }


    public void ajouterPrixIngredient(PrixIngredient prixIngredient) {
        this.prixIngredientRepo.save(prixIngredient);
    }

    
    public PrixIngredient getDernierPrixIngredient(Long id) {
        return this.prixIngredientRepo.getDernierPrixIngredient(id);
    }


    public List<PrixIngredient> getDerniersPrixIngredients() {
        return this.prixIngredientRepo.getDerniersPrixIngredients();
    }
}
