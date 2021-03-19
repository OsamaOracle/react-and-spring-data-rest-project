FROM openjdk:8-jre-slim

COPY target/react-and-spring-data-rest-*.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","-Doracle.jdbc.timezoneAsRegion=false","/app.jar"]
