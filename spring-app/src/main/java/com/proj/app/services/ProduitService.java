package com.proj.app.services;

import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.proj.app.entities.*;
import com.proj.app.repositories.ProduitConseilleRepository;
import com.proj.app.repositories.ProduitRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

@Service
public class ProduitService 
{
    @Autowired
    private ProduitRepository produitRepo;

    @Autowired
    private PrixProduitService prixProdService;

    @Autowired
    private ProduitConseilleRepository produitConseilleRepo;


    public Produit getProduitById(Long id) {
        return this.produitRepo.findById(id)
         .orElseThrow(() -> new RuntimeException("Produit avec id "+id+" introuvable !"));
    }

// Méthode pour récupérer les produits paginés
    public Page<Produit> getPaginatedProduits(int page, int size) {
        // Création d'un objet Pageable avec la page et la taille spécifiées
        Pageable pageable = PageRequest.of(page, size);
        return produitRepo.findAll(pageable); // Utilisation de findAll(Pageable)
    }

    public List<Produit> getAll() {
        return this.produitRepo.findAll();
    }

    public Page<Produit> getPaginatedProduits(Pageable pageable) {
        return produitRepo.findAll(pageable); // Utilisation de findAll(Pageable)
    }    

    @Transactional
    public void ajouterProduit(Produit produit, double prixProduit) {
    // Sauvegarder le produit
        this.produitRepo.save(produit);
    
    // Sauvegarder le prix du produit
        PrixProduit prixProd = new PrixProduit();
        prixProd.setProduit(produit);
        prixProd.setDateModif(LocalDate.now());
        prixProd.setPrix(prixProduit);
        this.prixProdService.ajouterPrixProduit(prixProd);
    }

    @Transactional
    public void mettreAJourProduit(Long id, Produit nouveau, double nouveauPrix) {
    // Modification du produit
        Produit produit = this.getProduitById(id);
        produit.setNom(nouveau.getNom());
        produit.setDescriptions(nouveau.getDescriptions());
        this.produitRepo.save(produit);

    // Sauvegarder le nouveau prix
        PrixProduit prixProd = new PrixProduit();
        prixProd.setProduit(produit);
        prixProd.setDateModif(LocalDate.now());
        prixProd.setPrix(nouveauPrix);
        this.prixProdService.ajouterPrixProduit(prixProd);
    }


    public void ajouterProduitConseille(ProduitConseille prod) {
        this.produitConseilleRepo.save(prod);
    }


    public List<Produit> getProduitsConseilles(Integer annee, Integer mois) {
        return this.produitConseilleRepo.getProduitsConseilles(annee, mois);
    }
}
