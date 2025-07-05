package com.proj.app.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.PrixProduit;

@Repository
public interface PrixProduitRepository extends JpaRepository<PrixProduit, Long>
{
    @Query(value = "SELECT * FROM prix_produits WHERE id_produit=:id ORDER BY "
    +"id_produit, id_prix_prod DESC LIMIT 1", nativeQuery=true)
    public PrixProduit getDernierPrixProduit(@Param("id") Long id);

    @Query(value = "SELECT DISTINCT ON (pi.id_produit) pi.*"
    +" FROM prix_produits pi"
    +" ORDER BY pi.id_produit, pi.id_prix_prod DESC", nativeQuery=true)
    public List<PrixProduit> getDerniersPrixProduits();

    @Query(value = "SELECT DISTINCT ON (pi.id_produit) pi.*"
    +" FROM prix_produits pi"
    +" JOIN stock_produits sp ON pi.id_produit=sp.id_produit"
    +" WHERE sp.quantite>0"
    +" ORDER BY pi.id_produit, pi.id_prix_prod DESC", nativeQuery=true)
    public List<PrixProduit> getDerniersPrixProduitsDispo();

    @Query(value = "SELECT pp.* FROM prix_produits pp JOIN produits p"
    +" ON pp.id_produit=p.id_produit WHERE (:idProd IS NULL OR pp.id_produit=:idProd )"
    +" AND (:dateMin is NULL OR :dateMin='' OR pp.date_modif>=CAST(:dateMin AS DATE))"
    +" AND (:dateMax is NULL OR :dateMax='' OR pp.date_modif<=CAST(:dateMax AS DATE))"
    +" AND (:idProd IS NULL OR p.id_produit = :idProd)", nativeQuery = true)
    public List<PrixProduit> getHistoriquePrixProduit(
        @Param("dateMin") String dateMin,
        @Param("dateMax") String dateMax,
        @Param("idProd") Long idProduit
    );
}
