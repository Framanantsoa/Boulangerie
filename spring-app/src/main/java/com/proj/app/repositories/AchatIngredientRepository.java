package com.proj.app.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.AchatIngredient;

@Repository
public interface AchatIngredientRepository extends JpaRepository<AchatIngredient, Long>
{
    @Query(value = "SELECT a.* FROM achats_ingredients a "
        +"JOIN prix_ingredients pi on a.id_prix_ingred=pi.id_prix_ingred "
        +"JOIN ingredients i on pi.id_ingredient=i.id_ingredient "
    +"WHERE i.id_ingredient= :id", nativeQuery = true)
    public List<AchatIngredient> getAchatsIngredientsAvecFiltre(@Param("id") Long id);
}
