package com.proj.app.services;

import com.proj.app.entities.Ingredient;
import com.proj.app.entities.PrixIngredient;
import com.proj.app.repositories.IngredientRepository;
import com.proj.app.repositories.PrixIngredientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDate;
import java.util.List;

@Service
public class IngredientService 
{
    @Autowired
    private IngredientRepository ingredientRepo;

    @Autowired
    private PrixIngredientRepository prixIngredientRepo;

// CRUD
    public Ingredient getIngredientById(Long id) {
        return this.ingredientRepo.findById(id)
            .orElseThrow(() -> new RuntimeException("Ingrédient introuvable"));
    }

    public Page<Ingredient> getAllIngredients(Pageable page) {
        return this.ingredientRepo.findAll(page);
    }

    public List<Ingredient> getAllIngredients() {
        return this.ingredientRepo.findAll();
    }

    public Ingredient ajouterIngredient(Ingredient ingredient) {
        return this.ingredientRepo.save(ingredient);
    }

    @Transactional
    public void updateIngredient(Long id, Ingredient updatedIngredient, double nouveauPrix)
     throws Exception {
        Ingredient ingredient = this.getIngredientById(id);

        // Mise à jour de l'ingrédient
        ingredient.setNom(updatedIngredient.getNom());
        ingredient.setUnite(updatedIngredient.getUnite());
        ingredient.setDescriptions(updatedIngredient.getDescriptions());
        this.ingredientRepo.save(ingredient);

        // Ajout d'un nouveau prix
        PrixIngredient prixIngredient = new PrixIngredient();
        prixIngredient.setIngredient(ingredient);
        prixIngredient.setPrix(nouveauPrix);
        prixIngredient.setDateModif(LocalDate.now());
        this.prixIngredientRepo.save(prixIngredient);
    }    

}
