package com.proj.app.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.VenteProduit;

@Repository
public interface VenteProduitRepository extends JpaRepository<VenteProduit, Long>
{
    @Query(value = "SELECT distinct vp.* FROM ventes_produits vp"
        +" JOIN prix_produits pp on vp.id_prix_prod=pp.id_prix_prod"
        +" JOIN produits p on pp.id_produit=p.id_produit"
        +" JOIN types_produits tp on p.id_type_prod=tp.id_type_prod"
        +" JOIN recettes r on p.id_produit=r.id_produit"
        +" JOIN details_recettes d on r.id_recette=d.id_recette"
        +" JOIN ingredients i on d.id_ingredient=i.id_ingredient"
        +" JOIN types_ingredients ti on i.id_type_ingred=ti.id_type_ingred"
    +" WHERE (:idTypeProd IS NULL OR tp.id_type_prod = :idTypeProd)"
    +" AND (:idTypeIngred IS NULL OR ti.id_type_ingred = :idTypeIngred)"
    +" ORDER BY vp.date_vente DESC",nativeQuery = true)
    List<VenteProduit> findVenteProduitAvecCritere(
        @Param("idTypeProd")Long idTypeProd,
        @Param("idTypeIngred")Long idTypeIngred
    );
}
