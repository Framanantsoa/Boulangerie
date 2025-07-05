package com.proj.app.services;

import org.springframework.stereotype.Service;

@Service
public class StockService 
{
//     @Autowired
//     private StockIngredientRepository stockRepo;

//     public void mettreAJourStock(Long idIngredient, double quantiteAchetee) {
//         StockIngredient stock = stockRepo.findByIngredientId(idIngredient)
//                 .orElseThrow(() -> new RuntimeException("Stock introuvable pour l'ingrédient ID : " + idIngredient));
        
//         // Log pour vérifier l'objet stock avant mise à jour
//         System.out.println("Stock avant mise à jour: " + stock.getQuantite());
        
//         // Mise à jour de la quantité
//         stock.setQuantite(stock.getQuantite() + quantiteAchetee);
        
//         // Log pour vérifier l'objet stock après mise à jour
//         System.out.println("Stock après mise à jour: " + stock.getQuantite());
    
//         stockRepo.save(stock);  // Sauvegarde la mise à jour
//     }
    
}
