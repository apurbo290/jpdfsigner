FROM docker.io/maven:3.9.12-amazoncorretto-25 as builder

WORKDIR /app

COPY . .

RUN mvn package

FROM docker.io/amazoncorretto:25

WORKDIR /app

COPY --from=builder /app/target/jpdfsigner-1.0-SNAPSHOT.jar /app

CMD [ "java", "-jar", "jpdfsigner-1.0-SNAPSHOT.jar" ]
