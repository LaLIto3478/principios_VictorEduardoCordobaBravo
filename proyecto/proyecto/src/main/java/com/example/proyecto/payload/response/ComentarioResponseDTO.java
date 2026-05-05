package com.example.proyecto.payload.response;

import com.example.proyecto.models.Comentario;
import java.time.LocalDateTime;
import java.util.Map;

public class ComentarioResponseDTO {
    private Long id;
    private String contenido;
    private String autor;
    private LocalDateTime fechaCreacion;
    private Map<String, Long> conteoReacciones;

    public ComentarioResponseDTO(Comentario comentario, Map<String, Long> conteoReacciones) {
        this.id = comentario.getId();
        this.contenido = comentario.getContenido();
        this.autor = comentario.getUsuario().getUsername();
        this.fechaCreacion = comentario.getFechaCreacion();
        this.conteoReacciones = conteoReacciones;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getContenido() { return contenido; }
    public void setContenido(String contenido) { this.contenido = contenido; }
    public String getAutor() { return autor; }
    public void setAutor(String autor) { this.autor = autor; }
    public LocalDateTime getFechaCreacion() { return fechaCreacion; }
    public void setFechaCreacion(LocalDateTime fechaCreacion) { this.fechaCreacion = fechaCreacion; }
    public Map<String, Long> getConteoReacciones() { return conteoReacciones; }
    public void setConteoReacciones(Map<String, Long> conteoReacciones) { this.conteoReacciones = conteoReacciones; }
}