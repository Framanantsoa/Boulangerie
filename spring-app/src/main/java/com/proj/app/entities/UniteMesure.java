package com.proj.app.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "unites")
public class UniteMesure 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_unite")
    private Long id;

    @Column(name = "nom_unite")
    private String nom;

    
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
}
