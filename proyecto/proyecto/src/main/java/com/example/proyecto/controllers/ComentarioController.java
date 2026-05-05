package com.example.proyecto.controllers;

import com.example.proyecto.models.Comentario;
import com.example.proyecto.models.Telefono;
import com.example.proyecto.models.User;
import com.example.proyecto.payload.request.ComentarioRequest;
import com.example.proyecto.payload.response.ComentarioResponseDTO;
import com.example.proyecto.payload.response.MessageResponse;
import com.example.proyecto.repositories.ComentarioRepository;
import com.example.proyecto.repositories.TelefonoRepository;
import com.example.proyecto.repositories.UserRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.stream.Collectors;

import java.util.HashMap;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/comentarios")
public class ComentarioController {

    @Autowired
    private ComentarioRepository comentarioRepository;

    @Autowired
    private TelefonoRepository telefonoRepository;

    @Autowired
    private UserRepository userRepository;

    @PostMapping("")
    public ResponseEntity<?> createComentario(@Valid @RequestBody ComentarioRequest request) {
        // Obtenemos el usuario autenticado
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userRepository.findByUsername(auth.getName())
                .orElseThrow(() -> new RuntimeException("Error: Usuario no encontrado."));

        Telefono telefono = telefonoRepository.findById(request.getTelefonoId())
                .orElseThrow(() -> new RuntimeException("Error: Teléfono no encontrado."));

        Comentario comentario = new Comentario(request.getContenido(), user, telefono);
        comentarioRepository.save(comentario);

        return ResponseEntity.ok(new MessageResponse("Comentario publicado con éxito"));
    }

    @GetMapping("/telefono/{telefonoId}")
    public Page<ComentarioResponseDTO> getComentariosByTelefono(@PathVariable Long telefonoId, Pageable pageable) {
        Page<Comentario> comentarios = comentarioRepository.findByTelefonoId(telefonoId, pageable);

        return comentarios.map(comentario -> {
            // Agrupamos y contamos las reacciones mágicamente con Streams
            Map<String, Long> conteo = comentario.getReacciones().stream()
                    .collect(Collectors.groupingBy(cr -> cr.getReaccion().getNombre().name(), Collectors.counting()));

            return new ComentarioResponseDTO(comentario, conteo);
        });
    }
}