package com.proj.app.entities;

import java.time.LocalDate;
import jakarta.persistence.*;

@Entity
@Table(name = "prix_ingredients")
public class PrixIngredient 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_prix_ingred")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_ingredient", nullable = false)
    private Ingredient ingredient;

    @Column(name = "prix_ingred", nullable = false)
    private double prix;

    @Column(name = "date_modif", nullable = false)
    private LocalDate dateModif;

    // Getters et setters
    public Long getId() {
        return id;
    }
    public void setId(Long idPrixIngred) {
        this.id = idPrixIngred;
    }

    public Ingredient getIngredient() {
        return ingredient;
    }
    public void setIngredient(Ingredient ingredient) {
        this.ingredient = ingredient;
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
