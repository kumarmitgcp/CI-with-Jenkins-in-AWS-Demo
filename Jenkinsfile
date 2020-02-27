pipeline {
    agent any 	
	environment {
		
		PROJECT_ID = 'PROJECT-ID'
                CLUSTER_NAME = 'CLUSTER-NAME'
                LOCATION = 'CLUSTER-LOCATION'
                CREDENTIALS_ID = 'gke'		
	}
	
    stages {	
	   stage('Scm Checkout') {            
		steps {
                  checkout scm
		}	
           }
           
	   stage('Build') { 
                steps {
                  echo "Cleaning and packaging..."
                  sh 'mvn clean package'		
                }
           }
	   stage('Test') { 
		steps {
	          echo "Testing..."
		  sh 'mvn test'
		}
	   }
	   stage('Build Docker Image') { 
		steps {
                   script {
                      myapp = docker.build("kumarmitdocker/devops:${env.BUILD_ID}")
                   }
                }
	   }
	   stage("Push Docker Image") {
                steps {
                   script {
                      docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                     }
                   }
                }
            }
	   
           stage('Deploy') { 
                steps {
                   echo  "Deploying..."
               }
          }
    }
}

