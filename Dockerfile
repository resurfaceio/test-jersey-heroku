FROM maven:3.3.9-jdk-8
RUN mkdir -p /app
WORKDIR /app
COPY pom.xml /app/
COPY src /app/src
RUN mvn package
EXPOSE 8080
CMD mvn exec:java