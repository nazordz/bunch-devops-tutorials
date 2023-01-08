FROM amazoncorretto:19.0.1-alpine3.16 as builder

WORKDIR /app
 
COPY gradlew build.gradle settings.gradle .

COPY gradle gradle
 
COPY src src

RUN ./gradlew clean build

FROM amazoncorretto:19.0.1-alpine3.16

COPY --from=builder /app/build/libs/*.jar /app/java-app.jar

ENTRYPOINT ["java","-jar","/app/java-app.jar"]
