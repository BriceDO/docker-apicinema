# Etape 1 : Lancer le build et créer fichier jar
FROM maven:3.8.4-jdk-11 as BUILD
WORKDIR /app
COPY . .
RUN mvn package

# Etape 2 : Construire l'image JAVA
FROM openjdk:11
WORKDIR /app
COPY --from="BUILD" app/target/ApiCinema-0.0.1-SNAPSHOT.jar ./app.jar
EXPOSE 80
CMD ["java", "-jar", "app.jar"]