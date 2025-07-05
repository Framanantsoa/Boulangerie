package com.proj.app.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "produits")
public class Produit 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_produit")
    private Long id;

    @Column(name = "nom_produit")
    private String nom;

    @Column(name = "descriptions")
    private String descriptions;

    @ManyToOne
    @JoinColumn(name = "id_type_prod")
    private TypeProduit type;

    @OneToOne(mappedBy = "produit", cascade = CascadeType.ALL)
    private StockProduit stock;

    
// GETTERS ET SETTERS
    public Long getId() {
        return this.id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return this.nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescriptions() {
        return this.descriptions;
    }
    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public StockProduit getStock() {
        return this.stock;
    }
    public void setStock(StockProduit stock) {
        this.stock = stock;
    }

    public TypeProduit getType() {
        return this.type;
    }
    public void setType(TypeProduit type) {
        this.type = type;
    }
}
