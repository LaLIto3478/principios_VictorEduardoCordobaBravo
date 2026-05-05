package com.example.proyecto.models;

import jakarta.persistence.*;

@Entity
@Table(name = "telefono_reacciones", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"user_id", "telefono_id"})
})
public class TelefonoReaccion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User usuario;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "telefono_id", nullable = false)
    private Telefono telefono;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "reaccion_id", nullable = false)
    private Reaccion reaccion;

    public TelefonoReaccion() {}

    // Getters y Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public User getUsuario() { return usuario; }
    public void setUsuario(User usuario) { this.usuario = usuario; }
    public Telefono getTelefono() { return telefono; }
    public void setTelefono(Telefono telefono) { this.telefono = telefono; }
    public Reaccion getReaccion() { return reaccion; }
    public void setReaccion(Reaccion reaccion) { this.reaccion = reaccion; }
}