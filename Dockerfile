# Use Maven to build the project
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Use a lightweight JDK image to run the application
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/esb_service.jar /app/esb_service.jar
EXPOSE 8080
CMD ["java", "-Xmx256m", "-Xms128m", "-jar", "/app/esb_service.jar"]