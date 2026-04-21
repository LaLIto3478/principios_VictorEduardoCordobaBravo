package com.example.proyecto.controllers;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import com.example.proyecto.models.Marca;
import com.example.proyecto.repositories.MarcaRepository;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@CrossOrigin(originPatterns = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/marcas")
public class MarcaController {
    @Autowired
    private MarcaRepository marcaRepository;

    @GetMapping("")
    public Page<Marca> getMarcas(Pageable pageable){
        return marcaRepository.findAll(pageable);
    }

    @PostMapping("")
    public Marca createMarca(@Valid @RequestBody Marca marca) {
        // 1. Extraemos quién es el usuario logueado gracias al JWT
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String usernameAutenticado = auth.getName();

        // 2. Creamos la marca y le asignamos el creador
        Marca miMarca = new Marca(marca.getNombre(), marca.getImagenUrl());
        miMarca.setCreatedBy(usernameAutenticado);

        marcaRepository.save(miMarca);
        return miMarca;
    }

    @DeleteMapping("/{id}")
    public void deleteMarca(@PathVariable Long id) {
        marcaRepository.deleteById(id);
    }
}
