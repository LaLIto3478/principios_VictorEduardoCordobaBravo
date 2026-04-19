package com.postgres.demorpg.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.postgres.demorpg.models.Reaction;

@Repository
public interface ReactionRepository extends JpaRepository<Reaction, Long> {

}

