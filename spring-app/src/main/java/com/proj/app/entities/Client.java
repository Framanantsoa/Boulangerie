package com.proj.app.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "clients")
public class Client 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_client")
    private Long id;

    @Column(name = "nom_client")
    private String nom;

    @ManyToOne
    @JoinColumn(name = "id_genre")
    private Genre genre;


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

    public Genre getGenre() {
        return this.genre;
    }
    public void setGenre(Genre genre) {
        this.genre = genre;
    }
}
