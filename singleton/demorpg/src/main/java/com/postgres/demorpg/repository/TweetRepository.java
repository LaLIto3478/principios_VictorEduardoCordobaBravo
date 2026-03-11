package com.postgres.demorpg.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.postgres.demorpg.models.Tweet;

@Repository
public interface TweetRepository extends JpaRepository<Tweet, Long>{

}
