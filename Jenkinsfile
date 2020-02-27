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
                      myimage = docker.build("kumarmitdocker/devops:${env.BUILD_ID}")
                   }
                }
	   }
	   stage("Push Docker Image") {
                steps {
                   script {
                      docker.withRegistry('https://registry.hub.docker.com', 'docker') {
                            myimage.push("${env.BUILD_ID}")
                     }
                   }
                }
            }
	   
           stage('Deploy to K8s') { 
                steps{
                   echo "Deployment started ..."
		   //sh "sed -i 's/hello:latest/hello:${env.BUILD_ID}/g' deployment.yaml"
                   //step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
		   echo "Deployment Finished ..."
            }
          }
    }
}

