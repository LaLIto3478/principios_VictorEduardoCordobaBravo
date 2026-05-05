package com.example.proyecto.models;

import jakarta.persistence.*;

@Entity
@Table(name = "reacciones")
public class Reaccion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private EReaccion nombre;

    public Reaccion() {}

    public Reaccion(EReaccion nombre) {
        this.nombre = nombre;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public EReaccion getNombre() { return nombre; }
    public void setNombre(EReaccion nombre) { this.nombre = nombre; }
}