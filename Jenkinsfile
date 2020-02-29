pipeline {
    agent any 	
	environment {
		
		PROJECT_ID = 'third-fire-260721'
                CLUSTER_NAME = 'k8s-cluster1'
                LOCATION = 'europe-north1-a'
                CREDENTIALS_ID = 'kubernetes'		
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
		     /* commented docker hub image building   
                      myimage = docker.build("kumarmitdocker/devops:${env.BUILD_ID}")
		     */
		      myimage = docker.build("gcr.io/third-fire-260721/kumarmitdocker/devops:${env.BUILD_ID}")
                   }
                }
	   }
	   stage("Push Docker Image") {
                steps {
                   script {
                   /*  //Commented Docker Hub registry push
			   docker.withRegistry('https://registry.hub.docker.com', 'docker') {
                            myimage.push("${env.BUILD_ID}")		
                     }
		     */
			   docker.withRegistry('https://gcr.io', 'gcr:gcrcredential') {
                            myimage.push("${env.BUILD_ID}")		
                     }
			   
                   }
                }
            }
	   
           stage('Deploy to K8s') { 
                steps{
                   echo "Deployment started ..."
		   sh 'ls -ltr'
		   sh 'pwd'
		   sh "sed -i 's/tagversion/${env.BUILD_ID}/g' deployment.yaml"
                   step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
		   echo "Deployment Finished ..."
            }
          }
    }
}

