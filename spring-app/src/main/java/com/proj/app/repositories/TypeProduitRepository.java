package com.proj.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.TypeProduit;

@Repository
public interface TypeProduitRepository extends JpaRepository<TypeProduit, Long>
{
    
}
