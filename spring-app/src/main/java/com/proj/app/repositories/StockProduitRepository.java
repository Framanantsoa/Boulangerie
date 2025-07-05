package com.proj.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.StockProduit;

@Repository
public interface StockProduitRepository extends JpaRepository<StockProduit, Long>
{
    @Query(value = "SELECT sp.* FROM productions p"
        +" JOIN recettes r on p.id_recette=r.id_recette"
        +" JOIN produits pt on r.id_produit=pt.id_produit"
        +" JOIN stock_produits sp on pt.id_produit=sp.id_produit"
    +" WHERE p.id_production = :id", nativeQuery = true)
    public StockProduit getStockProduitPourProduction(@Param("id") Long id);

    @Query(value = "SELECT sp.* FROM ventes_produits vp"
        +" JOIN prix_produits pp on vp.id_prix_prod=pp.id_prix_prod"
        +" JOIN stock_produits sp on pp.id_produit=sp.id_produit"
    +" WHERE vp.id_vente_prod = :id" ,nativeQuery = true)
    public StockProduit getStockProduitApresVente(@Param("id") Long id);
}
