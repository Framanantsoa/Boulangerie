package com.proj.app.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.proj.app.entities.*;
import com.proj.app.repositories.PrixProduitRepository;

@Service
public class PrixProduitService 
{
    @Autowired
    private PrixProduitRepository prixProduitRepo;

    public PrixProduit getById(Long id) {
        return prixProduitRepo.findById(id)
         .orElseThrow(() -> new RuntimeException("Prix du produit introuvable !"));
    }


    public void ajouterPrixProduit(PrixProduit prixProduit) {
        this.prixProduitRepo.save(prixProduit);
    }


    public PrixProduit getDernierPrixProduit(Long id) {
        return this.prixProduitRepo.getDernierPrixProduit(id);
    }


    public List<PrixProduit> getDerniersPrixProduits() {
        return this.prixProduitRepo.getDerniersPrixProduitsDispo();
    }

    public List<PrixProduit> getAll() {
        return this.prixProduitRepo.findAll();
    }

    public List<PrixProduit> getHistoriquePrixProduits(
     String dateMin, String dateMax, Long idProd) {
        return this.prixProduitRepo.getHistoriquePrixProduit(dateMin, dateMax, idProd);
    }
}
