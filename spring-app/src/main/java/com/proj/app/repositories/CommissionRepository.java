package com.proj.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.proj.app.entities.Commission;

@Repository
public interface CommissionRepository extends JpaRepository<Commission, Long>
{
    
}
