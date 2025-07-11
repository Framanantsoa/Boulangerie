package com.proj.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.proj.app.entities.Genre;

@Repository
public interface GenreRepository extends JpaRepository<Genre, Long>
{
    
}
