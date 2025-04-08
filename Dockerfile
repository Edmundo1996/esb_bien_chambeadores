# Use a base image for Java Spring Boot
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the application JAR file
COPY target/esb_service.jar /app/esb_service.jar

# Expose the application port
EXPOSE 8080

# Set stricter memory limits for the JVM
ENV JAVA_OPTS="-Xmx256m -Xms128m"

# Run the application with the specified memory limits
CMD ["java", "-Xmx256m", "-Xms128m", "-jar", "/app/esb_service.jar"]