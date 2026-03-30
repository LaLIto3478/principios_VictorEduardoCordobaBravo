package com.example.proyecto.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.proyecto.models.Marca;

@Repository
public interface MarcaRepository extends JpaRepository<Marca, Long> {
}
