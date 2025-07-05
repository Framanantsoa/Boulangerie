package com.proj.app.entities;

import java.time.LocalDateTime;
import jakarta.persistence.*;

@Entity
@Table(name = "productions")
public class Production {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_production")
    private Long id;

    @Column(name = "date_production")
    private LocalDateTime dateTime;

    @ManyToOne
    @JoinColumn(name = "id_recette")
    private Recette recette;


// GETTERS ET SETTERS
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getDateTime() {
        return this.dateTime;
    }
    public void setDateTime(LocalDateTime date) {
        this.dateTime = date;
    }

    public Recette getRecette() {
        return recette;
    }
    public void setRecette(Recette recette) {
        this.recette = recette;
    }
}
