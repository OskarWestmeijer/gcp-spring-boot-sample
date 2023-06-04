FROM eclipse-temurin:17.0.3_7-jdk

COPY target/app.jar /app.jar
ENV JAVA_OPTS="-Xms250m -Xmx250m"

ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /app.jar"]