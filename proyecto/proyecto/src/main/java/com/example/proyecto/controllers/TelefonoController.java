package com.example.proyecto.controllers;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import com.example.proyecto.models.Telefono;
import com.example.proyecto.repositories.TelefonoRepository;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/telefonos")
public class TelefonoController {
    @Autowired
    private TelefonoRepository telefonoRepository;

    @GetMapping("")
    public Page<Telefono> getTelefonos(Pageable pageable){
        return telefonoRepository.findAll(pageable);
    }

    @PostMapping("")
    public Telefono createTelefono(@Valid @RequestBody Telefono telefono) {
        // 1. Extraemos quién es el usuario logueado
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String usernameAutenticado = auth.getName();

        Telefono miTelefono = new Telefono(
                telefono.getModelo(),
                telefono.getImagenUrl(),
                telefono.getDescripcion(),
                telefono.getProcesador(),
                telefono.getPantalla(),
                telefono.getNumeroCamaras(),
                telefono.getBateriaMah(),
                telefono.getFechaSalida(),
                telefono.getMarca()
        );

        // 2. Le asignamos el creador antes de guardar
        miTelefono.setCreatedBy(usernameAutenticado);

        telefonoRepository.save(miTelefono);
        return miTelefono;
    }

    @DeleteMapping("/{id}")
    public void deleteTelefono(@PathVariable Long id) {
        telefonoRepository.deleteById(id);
    }
}
