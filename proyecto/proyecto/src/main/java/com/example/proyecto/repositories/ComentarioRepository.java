package com.example.proyecto.repositories;

import com.example.proyecto.models.Comentario;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ComentarioRepository extends JpaRepository<Comentario, Long> {
    // Para listar los comentarios de un teléfono específico
    Page<Comentario> findByTelefonoId(Long telefonoId, Pageable pageable);
}