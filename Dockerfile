#FROM : 베이스 이미지, 빌드할 이미지가 어떤 이미지를 기반으로 하는지
#COPY <복사할 경로> <이미지에서 파일이 복사될 경로> : 파일을 이미지에 추가하는 것을 의미
#ENTRYPOINT : 컨테이너가 생성, 시작될 때 실행되는 명령어
#FROM openjdk:17-oracle

# build/libs/docker-test-*.jar 파일을 이미지의 app.jar 에 복사
#COPY build/libs/docker-test-*.jar app.jar
#COPY build/libs/*.jar app.jar

# java -jar app.jar 명령어가 실행되어 복사해두었던 jar파일을 실행하여 SpringBoot 프로젝트를 실행
#ENTRYPOINT ["java", "-jar", "app.jar"]

FROM openjdk:17-oracle
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]