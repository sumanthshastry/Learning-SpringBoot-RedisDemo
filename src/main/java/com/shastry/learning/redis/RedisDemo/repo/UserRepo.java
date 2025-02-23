package com.shastry.learning.redis.RedisDemo.repo;

import com.shastry.learning.redis.RedisDemo.model.User;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.redis.core.RedisHash;

@RedisHash
public interface UserRepo extends MongoRepository<User, String> {

}
