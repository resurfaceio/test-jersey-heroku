FROM resurfaceio/python-maven:2.3.0
RUN mkdir -p /app
WORKDIR /app
ADD . /app
EXPOSE 8080
CMD mvn package exec:java