package com.proj.app.entities;

import java.time.LocalDate;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "achats_ingredients")
public class AchatIngredient 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_achat_ingred")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_prix_ingred")
    private PrixIngredient prixIngredient;

    @Column(name = "quantite_ingred")
    private double quantite;

    @Column(name = "date_achat")
    private LocalDate dateAchat;


// GETTERS ET SETTERS
    public Long getId() {
        return this.id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public PrixIngredient getPrixIngredient() {
        return this.prixIngredient;
    }
    public void setPrixIngredient(PrixIngredient p) {
        this.prixIngredient = p;
    }

    public double getQuantite() {
        return this.quantite;
    }
    public void setQuantite(double qtt) {
        this.quantite = qtt;
    }

    public LocalDate getDateAchat() {
        return this.dateAchat;
    }
    public void setDateAchat(LocalDate date) {
        this.dateAchat = date;
    }

}
