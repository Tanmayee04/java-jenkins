pipeline {
  agent any
  stages{
    stage ("Compile and run") {
      steps{
        sh "javac hello.java"
        sh "java hello.java"
      }
    }
  }
}
