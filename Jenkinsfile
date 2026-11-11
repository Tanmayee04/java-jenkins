pipeline {
  agent any
  stages{
    stage ("Pull code from Github"){
      steps{
        sh "git pull https://github.com/Tanmayee04/java-jenkins.git"
      }
    }
    stage ("Compile and run") {
      steps{
        sh 
        '''javac hello.java
        java hello.java'''
      }
    }
  }
}
