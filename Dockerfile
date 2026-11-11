FROM	eclipse-temurin:17-alpine
WORKDIR	/java-app
COPY	hello.java	/java-app
CMD	["java", "hello.java"]
