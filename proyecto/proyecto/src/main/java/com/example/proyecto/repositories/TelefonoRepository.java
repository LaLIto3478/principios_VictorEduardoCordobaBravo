package com.example.proyecto.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.proyecto.models.Telefono;

@Repository
public interface TelefonoRepository extends JpaRepository<Telefono, Long> {
}
