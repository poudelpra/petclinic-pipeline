FROM maven:3.9.9-eclipse-temurin-21
WORKDIR /app


COPY /target/*.jar app.jar

# Expose port and run the app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
