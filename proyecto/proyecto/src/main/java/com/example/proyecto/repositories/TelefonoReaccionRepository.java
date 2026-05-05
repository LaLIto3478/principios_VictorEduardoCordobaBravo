package com.example.proyecto.repositories;

import com.example.proyecto.models.TelefonoReaccion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TelefonoReaccionRepository extends JpaRepository<TelefonoReaccion, Long> {
    Optional<TelefonoReaccion> findByUsuarioIdAndTelefonoId(Long userId, Long telefonoId);
    long countByTelefonoIdAndReaccionId(Long telefonoId, Long reaccionId);
}