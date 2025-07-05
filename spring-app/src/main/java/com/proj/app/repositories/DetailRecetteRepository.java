package com.proj.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.DetailRecette;

@Repository
public interface DetailRecetteRepository extends JpaRepository<DetailRecette, Long>
{
    
}
