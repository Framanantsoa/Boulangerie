package com.proj.app.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.Client;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long>
{
    @Query(value = "SELECT DISTINCT c.* FROM clients c "
    + "JOIN ventes_produits v ON c.id_client = v.id_client "
    + "JOIN prix_produits pp ON v.id_prix_prod = pp.id_prix_prod "
    + "JOIN produits p ON pp.id_produit = p.id_produit "
    + "WHERE (:date_min IS NULL OR :date_min = '' OR v.date_vente >= CAST(:date_min AS DATE)) "
    + "AND (:date_max IS NULL OR :date_max = '' OR v.date_vente <= CAST(:date_max AS DATE)) "
    + "AND (:idProd IS NULL OR p.id_produit = :idProd)", nativeQuery = true)
    public List<Client> getClientsEnDate(
        @Param("idProd") Long idProduit,
        @Param("date_min") String dateMin,
        @Param("date_max") String dateMax
    );

    
    @Query(value = "SELECT * FROM clients WHERE nom_client = :nom", nativeQuery = true)
    public Client getClient(
        @Param("nom") String nom
    );
}
