# 🌿 GS 4 – Work-Life Balance API
> Projeto desenvolvido para a avaliação GS da disciplina de Microsserviços (FIAP).
> Tema escolhido: **Work–Life Balance** (Tema 4)

[![Java](https://img.shields.io/badge/Java-17-007396?logo=java)]()
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.3.0-brightgreen?logo=springboot)]()
[![Maven](https://img.shields.io/badge/Maven-3.9.6-C71A36?logo=apachemaven)]()
[![Docker](https://img.shields.io/badge/Docker-ready-2496ED?logo=docker)]()
[![Swagger](https://img.shields.io/badge/Swagger-UI-brightgreen?logo=swagger)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)]()

---

## Participantes
- Gustavo Carvalho **RM550983**
- Letícia Vitalino **RM552481**

## 🎯 Objetivo do Projeto
Criar uma API simples, sem banco de dados, que disponibilize informações sobre o tema **Work–Life Balance**, retornando dados estruturados em JSON por meio de um endpoint GET.

Este projeto segue as práticas aplicadas em aula e também o padrão dos projetos:

- **study-apir**
- **consultas-api**

---

## 🧠 Tema da GS
O trabalho deve apresentar um endpoint que forneça informações relacionadas ao tema:

### **📌 Tema 4 – Work–Life Balance**
O equilíbrio entre vida profissional e pessoal (Work-Life Balance) é essencial para saúde mental, produtividade e qualidade de vida. A API fornece informações introdutórias organizadas em uma resposta JSON simples e clara.

---

## 🛠️ Tecnologias Utilizadas
- **Java 17**
- **Spring Boot 3**
- **Maven**
- **Swagger / Springdoc OpenAPI**
- **Docker**
- **Docker Compose**

---

## 📂 Estrutura do Projeto

```sh
gs-4-worklife-balance/
├── src/
│ ├── main/
│ │ ├── java/com/ogustavoress/worklifebalance/
│ │ │ ├── Gs4WorkLifeBalanceApplication.java
│ │ │ ├── controller/
│ │ │ │ └── TemaController.java
│ │ │ └── dto/
│ │ │ └── TemaInfoResponse.java
│ │ └── resources/
│ │ └── application.properties
├── Dockerfile
├── docker-compose.yaml
├── pom.xml
├── mvnw / mvnw.cmd
└── README.md
```

---

## Como Executar o Projeto

### 1. Rodar via Maven Wrapper
```sh
./mvnw spring-boot:run
```

### 2. Rodar via Maven
```sh
mvn spring-boot:run
```

### 3. Rodar com docker
- build da imagem 
```sh
docker build -t ogustavoress/gs-4-worklife-balance:latest .
```
- Executar container
```sh
docker run -p 8081:8081 ogustavoress/gs-4-worklife-balance:latest
```
- docker compose
```sh
docker compose up -d
```
---

## Imagem no Docker Hub
A imagem oficial gerada pelo pipeline CD está disponível em:
https://hub.docker.com/r/ogustavoress/gs-4-worklife-balance

## Endpoints
- Exemplo de resposta JSON:
```json
{
  "tema": "Work-Life Balance",
  "descricao": "Equilíbrio entre vida pessoal e profissional, permitindo saúde emocional e produtividade.",
  "itens": [
    "Evitar jornadas excessivas",
    "Pausas durante o expediente",
    "Atividades fora do trabalho",
    "Tempo de qualidade com a família"
  ]
}
```

---

## Documentação (Swagger)
Após iniciar o projeto, acesse:
- **Swagger UI:**
http://localhost:8081/swagger-ui.html


- **OpenAPI JSON:**
http://localhost:8081/v3/api-docs

---

## Dockerfile (multi-stage)
O projeto utiliza build multi-stage para gerar imagens leves:
```dockerfile
FROM maven:3.9.11-eclipse-temurin-17 AS build
WORKDIR /opt/app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk-alpine
WORKDIR /opt/app
COPY --from=build /opt/app/target/*.jar app.jar
EXPOSE 8081
CMD ["java", "-jar", "app.jar"]

```
---