package com.example.proyecto.payload.request;

import jakarta.validation.constraints.NotNull;

public class ReaccionRequest {
    @NotNull
    private Long targetId;

    @NotNull
    private Long reaccionId;

    public Long getTargetId() { return targetId; }
    public void setTargetId(Long targetId) { this.targetId = targetId; }
    public Long getReaccionId() { return reaccionId; }
    public void setReaccionId(Long reaccionId) { this.reaccionId = reaccionId; }
}