package com.shastry.learning.redis.RedisDemo.service;

import com.shastry.learning.redis.RedisDemo.model.User;
import com.shastry.learning.redis.RedisDemo.repo.UserRepo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final UserRepo userRepo;

    @Cacheable(value = "users", key="#id")
    public User getUser(String id) {
        log.info("Getting user: {}", id);
        return userRepo.findById(id).orElseThrow(() -> new IllegalArgumentException("User not available: "+ id));
    }

    @CachePut(value = "users", key="#user.id")
    public User createUser(User user) {
        log.info("Created user: {}", user);
        return userRepo.save(user);
    }
}
