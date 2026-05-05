package com.example.proyecto.payload.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class ComentarioRequest {
    @NotNull
    private Long telefonoId;

    @NotBlank
    private String contenido;

    public Long getTelefonoId() { return telefonoId; }
    public void setTelefonoId(Long telefonoId) { this.telefonoId = telefonoId; }
    public String getContenido() { return contenido; }
    public void setContenido(String contenido) { this.contenido = contenido; }
}