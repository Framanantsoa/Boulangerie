package com.proj.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.UniteMesure;

@Repository
public interface UniteMesureRepository extends JpaRepository<UniteMesure, Long>
{
    
}
