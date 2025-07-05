package com.proj.app.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "ingredients")
public class Ingredient 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_ingredient")
    private Long id;

    @Column(name = "nom_ingredient")
    private String nom;

    @ManyToOne
    @JoinColumn(name = "id_unite")
    private UniteMesure unite;

    @Column(name = "descriptions")
    private String descriptions;

    @ManyToOne
    @JoinColumn(name = "id_type_ingred")
    private TypeIngredient type;

    @OneToOne(mappedBy = "ingredient", cascade = CascadeType.ALL)
    private StockIngredient stock;

    
    // Getters et Setters
    public Long getId() {
        return id;
    }
    public void setId(Long idIngredient) {
        this.id = idIngredient;
    }    

    public String getNom() {
        return nom;
    }
    public void setNom(String nomIngredient) {
        this.nom = nomIngredient;
    }

    public UniteMesure getUnite() {
        return unite;
    }
    public void setUnite(UniteMesure unite) {
        this.unite = unite;
    }

    public String getDescriptions() {
        return descriptions;
    }
    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public TypeIngredient getType() {
        return this.type;
    }
    public void setType(TypeIngredient type) {
        this.type = type;
    }

    public StockIngredient getStock() {
        return this.stock;
    }
    public void setStock(StockIngredient stock) {
        this.stock = stock;
    }

}
