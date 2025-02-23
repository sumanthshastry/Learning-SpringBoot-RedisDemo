# Java 17 base image for the app
FROM openjdk:17-jdk-slim-buster
LABEL authors="sumanth.shastry"

# Setup base dir for the app to run
WORKDIR /app

# Copy the app jar
COPY build/libs/RedisDemo*.jar /app/redisDemo.jar

ENTRYPOINT ["java", "-jar", "/app/redisDemo.jar"]