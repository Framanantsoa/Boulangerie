package com.proj.app.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.Production;

@Repository
public interface ProductionRepository extends JpaRepository<Production, Long> 
{
    @Query(value = "SELECT DISTINCT p.* " +
        "FROM productions p " +
        "JOIN recettes r ON p.id_recette = r.id_recette " +
        "JOIN produits pr ON r.id_produit = pr.id_produit " +
        "LEFT JOIN details_recettes dr ON r.id_recette = dr.id_recette " +
        "WHERE (:idIngredient IS NULL OR dr.id_ingredient = :idIngredient) " +
        "  AND (:idProduit IS NULL OR pr.id_produit = :idProduit)",
    nativeQuery = true)
    List<Production> findProductionsWithFilterNative(
        @Param("idIngredient") Long idIngredient,
        @Param("idProduit") Long idProduit);

}
