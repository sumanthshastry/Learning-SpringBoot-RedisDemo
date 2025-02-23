package com.shastry.learning.redis.RedisDemo.model;

import jakarta.persistence.Id;
import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document(collection = "user")
public class User {

    @Id
    private String id;

    private String name;

    private String email;

}

