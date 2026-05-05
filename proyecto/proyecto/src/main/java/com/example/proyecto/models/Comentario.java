package com.example.proyecto.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.time.LocalDateTime;
import java.util.Set;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "comentarios")
public class Comentario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(columnDefinition = "TEXT")
    private String contenido;

    private LocalDateTime fechaCreacion = LocalDateTime.now();

    // Quién hizo el comentario
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User usuario;

    // A qué teléfono pertenece
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "telefono_id", nullable = false)
    private Telefono telefono;

    @JsonIgnore
    @OneToMany(mappedBy = "comentario", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<ComentarioReaccion> reacciones;

    public Comentario() {}

    public Comentario(String contenido, User usuario, Telefono telefono) {
        this.contenido = contenido;
        this.usuario = usuario;
        this.telefono = telefono;
    }

    // Getters y Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getContenido() { return contenido; }
    public void setContenido(String contenido) { this.contenido = contenido; }
    public LocalDateTime getFechaCreacion() { return fechaCreacion; }
    public void setFechaCreacion(LocalDateTime fechaCreacion) { this.fechaCreacion = fechaCreacion; }
    public User getUsuario() { return usuario; }
    public void setUsuario(User usuario) { this.usuario = usuario; }
    public Telefono getTelefono() { return telefono; }
    public void setTelefono(Telefono telefono) { this.telefono = telefono; }

    public Set<ComentarioReaccion> getReacciones() { return reacciones; }
    public void setReacciones(Set<ComentarioReaccion> reacciones) { this.reacciones = reacciones; }
}