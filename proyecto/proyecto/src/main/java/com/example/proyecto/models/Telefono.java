package com.example.proyecto.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.time.LocalDate;
import java.util.List;
import java.util.Set;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.Map;
import jakarta.persistence.Transient;

@Entity
@Table(name="telefonos")
public class Telefono {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String modelo;

    private String imagenUrl;

    @Column(columnDefinition = "TEXT")
    private String descripcion;

    private String procesador;
    private String pantalla;
    private Integer numeroCamaras;
    private Integer bateriaMah;
    private LocalDate fechaSalida;
    private String createdBy;

    // Relación de la Llave Foránea
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="marca_id", nullable = false)
    private Marca marca;

    @JsonIgnore
    @OneToMany(mappedBy = "telefono", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comentario> comentarios;

    @JsonIgnore
    @OneToMany(mappedBy = "telefono", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<TelefonoReaccion> reacciones;

    @Transient
    private Map<String, Long> conteoReacciones;

    public Telefono() {}

    public Telefono(String modelo, String imagenUrl, String descripcion, String procesador, String pantalla, Integer numeroCamaras, Integer bateriaMah, LocalDate fechaSalida, Marca marca) {
        this.modelo = modelo;
        this.imagenUrl = imagenUrl;
        this.descripcion = descripcion;
        this.procesador = procesador;
        this.pantalla = pantalla;
        this.numeroCamaras = numeroCamaras;
        this.bateriaMah = bateriaMah;
        this.fechaSalida = fechaSalida;
        this.marca = marca;
    }

    // GETTERS AND SETTERS
    public Long getId() { return id; }
    public String getModelo() { return modelo; }
    public void setModelo(String modelo) { this.modelo = modelo; }

    public String getImagenUrl() { return imagenUrl; }
    public void setImagenUrl(String imagenUrl) { this.imagenUrl = imagenUrl; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public String getProcesador() { return procesador; }
    public void setProcesador(String procesador) { this.procesador = procesador; }

    public String getPantalla() { return pantalla; }
    public void setPantalla(String pantalla) { this.pantalla = pantalla; }

    public Integer getNumeroCamaras() { return numeroCamaras; }
    public void setNumeroCamaras(Integer numeroCamaras) { this.numeroCamaras = numeroCamaras; }

    public Integer getBateriaMah() { return bateriaMah; }
    public void setBateriaMah(Integer bateriaMah) { this.bateriaMah = bateriaMah; }

    public LocalDate getFechaSalida() { return fechaSalida; }
    public void setFechaSalida(LocalDate fechaSalida) { this.fechaSalida = fechaSalida; }

    public Marca getMarca() { return marca; }
    public void setMarca(Marca marca) { this.marca = marca; }

    public String getCreatedBy() {
        return createdBy;
    }
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public List<Comentario> getComentarios() { return comentarios; }
    public void setComentarios(List<Comentario> comentarios) { this.comentarios = comentarios; }

    public Set<TelefonoReaccion> getReacciones() { return reacciones; }
    public void setReacciones(Set<TelefonoReaccion> reacciones) { this.reacciones = reacciones; }

    public Map<String, Long> getConteoReacciones() { return conteoReacciones; }
    public void setConteoReacciones(Map<String, Long> conteoReacciones) { this.conteoReacciones = conteoReacciones; }
}
