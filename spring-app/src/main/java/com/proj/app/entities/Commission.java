package com.proj.app.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "commissions")
public class Commission
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_commission")
    private Long id;

    @Column(name = "valeur")
    private double valeur;

// GETTERS ET SETTERS
    public Long getId() {
        return this.id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public double getValeur() {
        return this.valeur;
    }
    public void setValeur(double valeur) {
        this.valeur = valeur;
    }

}
