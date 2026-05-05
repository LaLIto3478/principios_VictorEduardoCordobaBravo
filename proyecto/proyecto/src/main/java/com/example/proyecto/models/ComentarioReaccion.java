package com.example.proyecto.models;

import jakarta.persistence.*;

@Entity
@Table(name = "comentario_reacciones", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"user_id", "comentario_id"})
})
public class ComentarioReaccion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User usuario;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "comentario_id", nullable = false)
    private Comentario comentario;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "reaccion_id", nullable = false)
    private Reaccion reaccion;

    public ComentarioReaccion() {}

    // Getters y Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public User getUsuario() { return usuario; }
    public void setUsuario(User usuario) { this.usuario = usuario; }
    public Comentario getComentario() { return comentario; }
    public void setComentario(Comentario comentario) { this.comentario = comentario; }
    public Reaccion getReaccion() { return reaccion; }
    public void setReaccion(Reaccion reaccion) { this.reaccion = reaccion; }
}