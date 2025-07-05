package com.proj.app.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "stock_produits")
public class StockProduit 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_stock_prod")
    private Long id;

    @Column(name = "quantite")
    private double quantite;

    @OneToOne
    @JoinColumn(name = "id_produit")
    private Produit produit;


// GETTERS ET SETTERS
    public Long getId() {
        return this.id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public double getQuantite() {
        return this.quantite;
    }
    public void setQuantite(double qtt) {
        this.quantite = qtt;
    }

    public Produit getProduit() {
        return this.produit;
    }
    public void setProduit(Produit p) {
        this.produit = p;
    }
}
