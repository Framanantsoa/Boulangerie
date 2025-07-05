package com.proj.app.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.Produit;

@Repository
public interface ProduitRepository extends JpaRepository<Produit, Long>
{
    @Query(value = "SELECT * FROM produits WHERE estconseille = :val"
    , nativeQuery = true)
    public List<Produit> getProduitsConseille(
        @Param("val") boolean estConseille
    );
}
