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
        sh "docker build -t ${USER}/java-jenkins ."
      }
    }

    stage ("Run docker image") {
      steps {
        sh "docker run --rm ${USER}/java-jenkins"
      }
    }

    stage ("Push to Dockerhub") {
      steps {
        withCredentials([usernamePassword(credentialsId:"my-docker-hub-credentials-id", usernameVariable: "USER", passwordVariable: "PASS")]) {
          sh "echo ${PASS} | docker login -u ${USER} --password-stdin"
          sh "docker push ${USER}/java-jenkins"
        }
      }
    }

    stage ("K8S") {
      steps {
        sh "kubectl apply deployment.yaml"
        sh "kubectl get pods"
      }
    }

  }
}
