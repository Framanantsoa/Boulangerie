package com.proj.app.entities;

import java.time.LocalDate;
import jakarta.persistence.*;

@Entity
@Table(name = "ventes_produits")
public class VenteProduit 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_vente_prod")
    private Long id;

    @Column(name = "date_vente")
    private LocalDate date;

    @Column(name = "quantite_vendue")
    private double quantite;

    @ManyToOne
    @JoinColumn(name = "id_prix_prod")
    private PrixProduit prixProduit;

    @ManyToOne
    @JoinColumn(name = "id_client")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "id_commission")
    private Commission commission;


    
// GETTERS ET SETTERS
    public Long getId() {
        return this.id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getDate() {
        return this.date;
    }
    public void setDate(LocalDate date) {
        this.date = date;
    }

    public double getQuantite() {
        return this.quantite;
    }
    public void setQuantite(double quantite) {
        this.quantite = quantite;
    }

    public PrixProduit getPrixProduit() {
        return this.prixProduit;
    }
    public void setPrixProduit(PrixProduit prixProduit) {
        this.prixProduit = prixProduit;
    }

    public Client getClient() {
        return this.client;
    }
    public void setClient(Client client) {
        this.client = client;
    }

    public Commission getCommission() {
        return this.commission;
    }
    public void setCommission(Commission commission) {
        this.commission = commission;
    }
}
