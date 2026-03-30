package com.example.proyecto.controllers;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import com.example.proyecto.models.Marca;
import com.example.proyecto.repositories.MarcaRepository;

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
        Marca miMarca = new Marca(marca.getNombre(), marca.getImagenUrl());
        marcaRepository.save(miMarca);
        return miMarca;
    }

    @DeleteMapping("/{id}")
    public void deleteMarca(@PathVariable Long id) {
        marcaRepository.deleteById(id);
    }
}
