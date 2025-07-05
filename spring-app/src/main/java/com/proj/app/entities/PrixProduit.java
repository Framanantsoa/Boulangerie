package com.proj.app.entities;

import java.time.LocalDate;
import jakarta.persistence.*;

@Entity
@Table(name = "prix_produits")
public class PrixProduit
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_prix_prod")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_produit")
    private Produit produit;

    @Column(name = "prix_prod")
    private double prix;

    @Column(name = "date_modif")
    private LocalDate dateModif;

    // Getters et setters
    public Long getId() {
        return id;
    }
    public void setId(Long idPrixIngred) {
        this.id = idPrixIngred;
    }

    public Produit getProduit() {
        return this.produit;
    }
    public void setProduit(Produit produit) {
        this.produit = produit;
    }

    public double getPrix() {
        return prix;
    }
    public void setPrix(double prix) {
        this.prix = prix;
    }

    public LocalDate getDateModif() {
        return dateModif;
    }
    public void setDateModif(LocalDate dateModif) {
        this.dateModif = dateModif;
    }
}
