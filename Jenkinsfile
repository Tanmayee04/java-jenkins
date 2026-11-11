pipeline {
  agent any
  stages{
    stage ("Compile and run") {
      steps{
        sh '''javac hello.java
        java hello.java'''
      }
    }
    stage ("Build docker image") {
      steps {
        sh "docker build -t java-jenkins ."
      }
    }

    stage ("Run docker image") {
      steps {
        sh "docker run --rm java-jenkins"
      }
    }

    stage ("Push to Dockerhub") {
      steps {
        withCredentials([usernamePassword(credentialsId:"my-docker-hub-credentials-id", usernameVariable: "USER", passwordVariable: "PASS")]) {
          sh "echo ${PASS} | docker login -u ${USER} --password-stdin"
          sh "docker tag java-jenkins ${USER}/java-jenkins"
          sh "docker push ${USER}/java-jenkins"
        }
      }
    }
  }
}
