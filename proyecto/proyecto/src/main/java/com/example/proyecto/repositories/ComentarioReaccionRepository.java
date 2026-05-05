package com.example.proyecto.repositories;

import com.example.proyecto.models.ComentarioReaccion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ComentarioReaccionRepository extends JpaRepository<ComentarioReaccion, Long> {
    Optional<ComentarioReaccion> findByUsuarioIdAndComentarioId(Long userId, Long comentarioId);
    long countByComentarioIdAndReaccionId(Long comentarioId, Long reaccionId);
}