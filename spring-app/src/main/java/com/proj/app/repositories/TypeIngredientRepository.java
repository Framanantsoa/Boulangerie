package com.proj.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.TypeIngredient;

@Repository
public interface TypeIngredientRepository extends JpaRepository<TypeIngredient, Long>
{
    
}
