package com.proj.app.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "stock_ingredients")
public class StockIngredient 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_stock_ingredient")
    private Long id;

    @OneToOne
    @JoinColumn(name = "id_ingredient")
    private Ingredient ingredient;

    @Column(name = "quantite")
    private double quantite;

    
// GETTERS ET SETTERS
    public Long getId() {
        return this.id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public Ingredient getIngredient() {
        return this.ingredient;
    }
    public void setIngredient(Ingredient p) {
        this.ingredient = p;
    }

    public double getQuantite() {
        return this.quantite;
    }
    public void setQuantite(double qtt) {
        this.quantite = qtt;
    }

}
