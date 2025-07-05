package com.proj.app.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.PrixIngredient;

@Repository
public interface PrixIngredientRepository extends JpaRepository<PrixIngredient, Long>
{
    @Query(value = "SELECT * FROM prix_ingredients WHERE id_ingredient=:id ORDER BY "
    +"id_ingredient, id_prix_ingred DESC LIMIT 1", nativeQuery=true)
    public PrixIngredient getDernierPrixIngredient(@Param("id") Long id);


    @Query(value = "SELECT DISTINCT ON (pi.id_ingredient) pi.*"
    +" FROM prix_ingredients pi"
    +" ORDER BY pi.id_ingredient, pi.id_prix_ingred DESC", nativeQuery=true)
    public List<PrixIngredient> getDerniersPrixIngredients();
}
