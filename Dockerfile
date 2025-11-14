# Etapa 1: Build
FROM maven:3.9.11-eclipse-temurin-17 AS build
WORKDIR /opt/app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Runtime
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /opt/app
COPY --from=build /opt/app/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
EXPOSE 8081