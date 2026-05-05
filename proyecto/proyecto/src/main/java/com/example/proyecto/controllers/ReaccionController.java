package com.example.proyecto.controllers;

import com.example.proyecto.models.*;
import com.example.proyecto.payload.request.ReaccionRequest;
import com.example.proyecto.payload.response.MessageResponse;
import com.example.proyecto.repositories.*;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/reacciones")
public class ReaccionController {

    @Autowired
    private ReaccionRepository reaccionRepository;

    @Autowired
    private TelefonoReaccionRepository telefonoReaccionRepository;

    @Autowired
    private ComentarioReaccionRepository comentarioReaccionRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TelefonoRepository telefonoRepository;

    @Autowired
    private ComentarioRepository comentarioRepository;

    @PostMapping("/telefono")
    public ResponseEntity<?> reaccionarTelefono(@Valid @RequestBody ReaccionRequest request) {
        User user = getUsuarioAutenticado();
        Telefono telefono = telefonoRepository.findById(request.getTargetId())
                .orElseThrow(() -> new RuntimeException("Error: Teléfono no encontrado."));
        Reaccion reaccion = reaccionRepository.findById(request.getReaccionId())
                .orElseThrow(() -> new RuntimeException("Error: Reacción no encontrada."));

        Optional<TelefonoReaccion> existente = telefonoReaccionRepository.findByUsuarioIdAndTelefonoId(user.getId(), telefono.getId());

        if (existente.isPresent()) {
            TelefonoReaccion tr = existente.get();
            if (tr.getReaccion().getId().equals(reaccion.getId())) {
                // Si es la misma reacción, la quitamos (Toggle)
                telefonoReaccionRepository.delete(tr);
                return ResponseEntity.ok(new MessageResponse("Reacción eliminada"));
            } else {
                // Si es diferente, la actualizamos
                tr.setReaccion(reaccion);
                telefonoReaccionRepository.save(tr);
                return ResponseEntity.ok(new MessageResponse("Reacción actualizada"));
            }
        } else {
            // Es una nueva reacción
            TelefonoReaccion tr = new TelefonoReaccion();
            tr.setUsuario(user);
            tr.setTelefono(telefono);
            tr.setReaccion(reaccion);
            telefonoReaccionRepository.save(tr);
            return ResponseEntity.ok(new MessageResponse("Reacción añadada"));
        }
    }

    @PostMapping("/comentario")
    public ResponseEntity<?> reaccionarComentario(@Valid @RequestBody ReaccionRequest request) {
        User user = getUsuarioAutenticado();
        Comentario comentario = comentarioRepository.findById(request.getTargetId())
                .orElseThrow(() -> new RuntimeException("Error: Comentario no encontrado."));
        Reaccion reaccion = reaccionRepository.findById(request.getReaccionId())
                .orElseThrow(() -> new RuntimeException("Error: Reacción no encontrada."));

        Optional<ComentarioReaccion> existente = comentarioReaccionRepository.findByUsuarioIdAndComentarioId(user.getId(), comentario.getId());

        if (existente.isPresent()) {
            ComentarioReaccion cr = existente.get();
            if (cr.getReaccion().getId().equals(reaccion.getId())) {
                comentarioReaccionRepository.delete(cr);
                return ResponseEntity.ok(new MessageResponse("Reacción eliminada del comentario"));
            } else {
                cr.setReaccion(reaccion);
                comentarioReaccionRepository.save(cr);
                return ResponseEntity.ok(new MessageResponse("Reacción de comentario actualizada"));
            }
        } else {
            ComentarioReaccion cr = new ComentarioReaccion();
            cr.setUsuario(user);
            cr.setComentario(comentario);
            cr.setReaccion(reaccion);
            comentarioReaccionRepository.save(cr);
            return ResponseEntity.ok(new MessageResponse("Reacción añadida al comentario"));
        }
    }

    private User getUsuarioAutenticado() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return userRepository.findByUsername(auth.getName())
                .orElseThrow(() -> new RuntimeException("Error: Usuario no encontrado."));
    }
}