package com.proj.app.entities;

import java.util.List;
import jakarta.persistence.*;

@Entity
@Table(name = "recettes")
public class Recette 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_recette")
    private Long id;

    @Column(name = "nom_recette")
    private String nom;

    @ManyToOne
    @JoinColumn(name = "id_produit")
    private Produit produit;

    @OneToMany(mappedBy = "recette", cascade = CascadeType.ALL)
    private List<DetailRecette> detailsRecettes;


    // Getter et Setter 
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public Produit getProduit() {
        return produit;
    }
    public void setProduit(Produit produit) {
        this.produit = produit;
    }

    public String getNom() {
        return this.nom;
    }
    public void setNom(String arg) {
        this.nom = arg;
    }

    public List<DetailRecette> getDetailsRecettes() {
        return detailsRecettes;
    }
    public void setDetailsRecettes(List<DetailRecette> detailsRecettes) {
        this.detailsRecettes = detailsRecettes;
    }
}
