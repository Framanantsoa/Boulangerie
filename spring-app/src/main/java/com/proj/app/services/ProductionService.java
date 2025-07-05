package com.proj.app.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.proj.app.entities.Production;
import com.proj.app.entities.StockIngredient;
import com.proj.app.entities.StockProduit;
import com.proj.app.repositories.ProductionRepository;
import com.proj.app.repositories.StockIngredientRepository;
import com.proj.app.repositories.StockProduitRepository;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductionService 
{
    @Autowired
    private ProductionRepository productionRepo;

    @Autowired
    private StockIngredientRepository stockIngredientRepo;

    @Autowired
    private StockProduitRepository stockProduitRepo;


    public List<Production> getAll() {
        return this.productionRepo.findAll();
    }


    @Transactional
    public void ajouterNouvelleProduction(Production production) {
        String exceptionStr = "";
    // Valider la production
        this.productionRepo.save(production);
    // Vérifier le stock des ingrédients si insuffisant
        Long idProd = production.getId();
        List<StockIngredient> stockIngred = this.stockIngredientRepo.getStockIngredientsPourProduction(idProd);

        List<Double> restesStock = this.stockIngredientRepo.getRestesStockApresProduction(idProd);
        if(stockIngred.size() != restesStock.size()) {
            throw new RuntimeException("Données incohérentes pour les stocks !");
        }
        for(int i=0 ; i<stockIngred.size(); i++) {
            if(restesStock.get(i) < 0) {
                exceptionStr += stockIngred.get(i).getIngredient().getNom()
                +" insuffisant(e), " +(-restesStock.get(i))
                +" " +stockIngred.get(i).getIngredient().getUnite().getNom()
                +" nécessaire(s)-";
            }
        }
        if(!exceptionStr.isBlank()) throw new RuntimeException(exceptionStr);

    // Si c'est suffisant, diminuer le stock des ingrédients
        for(int j=0; j<stockIngred.size(); j++) {
            stockIngred.get(j).setQuantite(restesStock.get(j));
        }
        this.stockIngredientRepo.saveAll(stockIngred);
    // Augmenter le stock le produit
        StockProduit stockProd = this.stockProduitRepo.getStockProduitPourProduction(idProd);
        stockProd.setQuantite(stockProd.getQuantite()+1);
        this.stockProduitRepo.save(stockProd);
    }

    public List<Production> getAllAvecFiltre(Long idIngredient, Long idProduit) {
        return this.productionRepo.findProductionsWithFilterNative(idIngredient, idProduit);
    }
}
