package com.proj.app.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.StockIngredient;

@Repository
public interface StockIngredientRepository extends JpaRepository<StockIngredient, Long>
{
    @Query(value = "SELECT s.* FROM stock_ingredients s" 
    +" JOIN ingredients i ON s.id_ingredient=i.id_ingredient"
    +" JOIN prix_ingredients p ON i.id_ingredient=p.id_ingredient"
    +" WHERE p.id_prix_ingred=:id", nativeQuery = true)
    public StockIngredient getStockIngredientAvecPrix(@Param("id") Long idPrixIngredient);

    @Query(value = "SELECT si.* FROM productions p"
        +" JOIN recettes r on p.id_recette=r.id_recette"
        +" JOIN details_recettes d on r.id_recette=d.id_recette"
        +" JOIN stock_ingredients si on d.id_ingredient=si.id_ingredient"
    +" WHERE p.id_production = :id", nativeQuery = true)
    public List<StockIngredient> getStockIngredientsPourProduction(@Param("id") Long id);

    @Query(value = "SELECT si.quantite-d.quantite as stock_apres_production FROM productions p"
        +" JOIN recettes r on p.id_recette=r.id_recette"
        +" JOIN details_recettes d on r.id_recette=d.id_recette"
        +" JOIN stock_ingredients si on d.id_ingredient=si.id_ingredient"
    +" WHERE p.id_production = :id", nativeQuery = true)
    public List<Double> getRestesStockApresProduction(@Param("id") Long id);
}
