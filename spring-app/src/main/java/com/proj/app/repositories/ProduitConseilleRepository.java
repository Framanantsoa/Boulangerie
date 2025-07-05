package com.proj.app.repositories;

import com.proj.app.entities.Produit;
import com.proj.app.entities.ProduitConseille;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ProduitConseilleRepository extends JpaRepository<ProduitConseille, Long> {

    @Query(
        "SELECT p FROM ProduitConseille pc JOIN pc.produit p " +
        "WHERE (:annee IS NULL OR EXTRACT(YEAR FROM pc.dateAjout) = :annee) " +
        "AND (:mois IS NULL OR EXTRACT(MONTH FROM pc.dateAjout) = :mois)"
    )
    List<Produit> getProduitsConseilles(@Param("annee") Integer annee, @Param("mois") Integer mois);
}
