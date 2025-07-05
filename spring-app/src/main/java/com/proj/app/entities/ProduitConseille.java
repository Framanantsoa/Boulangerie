package com.proj.app.entities;

import java.time.LocalDate;
import jakarta.persistence.*;

@Entity
@Table(name = "produits_conseilles")
public class ProduitConseille
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_produit_cons")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_produit")
    private Produit produit;

    @Column(name = "date_ajout")
    private LocalDate dateAjout;

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

    public LocalDate getDateAjout() {
        return dateAjout;
    }
    public void setDateAjout(LocalDate dateAjout) {
        this.dateAjout = dateAjout;
    }
}
