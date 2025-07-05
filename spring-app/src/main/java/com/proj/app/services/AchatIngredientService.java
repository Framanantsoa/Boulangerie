package com.proj.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.proj.app.entities.*;
import com.proj.app.repositories.AchatIngredientRepository;
import com.proj.app.repositories.StockIngredientRepository;

@Service
public class AchatIngredientService 
{
    @Autowired
    private AchatIngredientRepository achatIngredRepo;

    @Autowired
    private StockIngredientRepository stockIngredRepo;


    @Transactional
    public void acheterIngredient(AchatIngredient achat) {
        achatIngredRepo.save(achat);

        // Modification de stock
        PrixIngredient prixIngred = achat.getPrixIngredient();
        StockIngredient stockIngred = this.stockIngredRepo.getStockIngredientAvecPrix(prixIngred.getId());

        stockIngred.setQuantite(stockIngred.getQuantite()+achat.getQuantite());
        this.stockIngredRepo.save(stockIngred);
    }

    public List<AchatIngredient> getAchatsIngredientsAvecFiltre(Long id) {
        return this.achatIngredRepo.getAchatsIngredientsAvecFiltre(id);
    }

    public List<AchatIngredient> getAllAchats() {
        return this.achatIngredRepo.findAll();
    }
}
