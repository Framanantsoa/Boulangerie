package com.proj.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.proj.app.entities.Recette;

@Repository
public interface RecetteRepository extends JpaRepository<Recette, Long>
{
    
}
