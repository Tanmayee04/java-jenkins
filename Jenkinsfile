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
        sh "docker run --name java1 java-jenkins"
      }
    }
  }
}
