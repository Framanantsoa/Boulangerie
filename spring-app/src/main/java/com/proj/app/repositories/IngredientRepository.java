package com.proj.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.Ingredient;

@Repository
public interface IngredientRepository extends JpaRepository<Ingredient, Long>
{

}
