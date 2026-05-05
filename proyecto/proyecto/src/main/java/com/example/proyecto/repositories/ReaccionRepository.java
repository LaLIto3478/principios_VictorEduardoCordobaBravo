package com.example.proyecto.repositories;

import com.example.proyecto.models.EReaccion;
import com.example.proyecto.models.Reaccion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ReaccionRepository extends JpaRepository<Reaccion, Long> {
    Optional<Reaccion> findByNombre(EReaccion nombre);
}