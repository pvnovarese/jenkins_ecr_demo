pipeline {
  environment {
    registry = '245634986451.dkr.ecr.us-east-2.amazonaws.com'
    registryCredential = 'ecr-credentials'
    repository = '245634986451.dkr.ecr.us-east-2.amazonaws.com/pvnovarese/jenkins-demo'
    imageLine = '245634986451.dkr.ecr.us-east-2.amazonaws.com/pvnovarese/jenkins-demo:latest'
  }
  agent any
  stages {
    stage('Checkout SCM') {
      steps {
        checkout scm
      }
    }
    stage('Build image and push to registry') {
      steps {
        sh 'docker --version'
        script {
          docker.withRegistry('https://' + registry, registryCredential) {
            def image = docker.build(repository)
            image.push()
          }
        }
      }
    }
    stage('Analyze with Anchore plugin') {
      steps {
        writeFile file: 'anchore_images', text: imageLine
        anchore name: 'anchore_images'
      }
    }
    stage('Build and push stable image to registry') {
      steps {
        script {
          docker.withRegistry('https://' + registry, registryCredential) {
            def image = docker.build(repository + ':prod')
            image.push()
          }
        }
      }
    }
  }
}
